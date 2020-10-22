class ApplicationController < ActionController::Base
  skip_forgery_protection
  helper_method  :all_categories
  helper_method  :current_user
  helper_method  :is_in_cart
  helper_method  :is_in_wishlist
  helper_method  :cat_count
  def cat_count qty, id, shop_id
    if !qty or qty == 'yes'
     p =  Product.where(category_id: id).where("(products.quantity > 0 OR products.is_inf_quantity)")
    else
    p =   Product.where(category_id: id)
    end
    if shop_id != nil
      p = p.where(shop_id: shop_id)
    end
    p.count
  end
  def all_categories
    Category.all
  end

  def show_products(str = nil, shop_id = nil)

    @category = nil
    @data = nil
    query = []
    if params[:category_id]
      @category = Category.includes(:products, :makers).find params[:category_id]
      @data = JSON.parse @category.data if @category.is_template
      @products = []
      @makers = []
      t = []
      @category.subtree.map do |el|
        t << el.id
      end
      @makers = Maker.includes(:categories).where(categories: {id: t})
      query << 'products.category_id in (' + t.join(', ') + ')'
    else
      @makers = nil
    end
    query << str if str
    if !params[:search].blank?
      query << "lower(products.title) like '%#{params[:search].downcase}%'"
    end
    if params['makers']
      query << 'products.maker_id in (' + params[:makers].join(', ') + ')'
    end
    if !params['price_min'].blank?
      query << "products.price >='#{params['price_min']}'"
    end
    if !params['price_max'].blank?
      query << "products.price <= '#{params['price_max']}'"
    end
    order = :title
    if params[:order] && params[:order] == 'price'
      order = :price
    end
    if !params[:qty] || params[:qty] == 'yes'
      query << "(products.quantity > 0 OR products.is_inf_quantity)"
    end

    @template = []
    if @category and @category.is_template
      @template = JSON.parse @category.data
    end
    query2 = []
    @template.select {|el| el['type'] == "Number"}.each do |el|
      if !params[el['id'].to_s + "_min"].blank? && !params[el['id'].to_s + "_max"].blank?
        query2 << "(attributes.code = '#{el['id']}' and attributes.num BETWEEN '#{params[el['id'].to_s + "_min"]}' and '#{params[el['id'].to_s + "_max"]}')"
      elsif !params[el['id'].to_s + "_min"].blank?
        query2 << "(attributes.code = '#{el['id']}' and attributes.num >= '#{params[el['id'].to_s + "_min"]}')"
      elsif !params[el['id'].to_s + "_max"].blank?
        query2 << "(attributes.code = '#{el['id']}' and attributes.num <= '#{params[el['id'].to_s + "_max"]}')"
      end
    end
    @template.select {|el| el['type'] == "Bool"}.each do |el|
      if !params[el['id'].to_s].blank?
        query2 << "(attributes.code = '#{el['id']}' and attributes.check = #{params[el['id'].to_s] == "Yes"})"
      end
    end
    query = query.join ' and '
    sum = query2.count
    query2 = query2.join ' or '
    pp query
    if sum == 0
      if order == :title
        @products = Product.where(query).order('LOWER(products.title)')
      else
        @products = Product.where(query).order(:price)
      end

    else
      @products = Product.find_by_sql("
       SELECT DISTINCT * FROM products WHERE id IN (SELECT attr.product_id FROM
        (
          SELECT COUNT(id) AS QTY, product_id FROM attributes WHERE (#{query2}) GROUP BY product_id
        ) AS attr WHERE (attr.QTY = #{sum} and #{query}))
            ")
      if order == :title
        @products = Product.where(id: @products.map(&:id)).order('LOWER(products.title)')
      else
        @products = Product.where(id: @products.map(&:id)).order(:price)
      end

    end

      if t
        puts "HI!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        pr = Product.where(category_id: t)
        pr = pr.where(shop_id: shop_id) if shop_id
        @max_price = pr.maximum(:price)
        @min_price = pr.minimum(:price)
      else
        pr = Product.all
        pr = pr.where(shop_id: shop_id) if shop_id
        @max_price = pr.maximum(:price)
        @min_price = pr.minimum(:price)
      end
    @max_price = 0 if !@max_price
    @min_price = 0 if !@min_price

    @makers = @makers.nil? ? nil : @makers.sort_by(&:name).sort_by{|el| el.is_another ? 1 : 0}
  end
  def is_in_cart(id)
    result = false
    if current_user and current_user.carts.find_by(product_id: id )
      result = true
    elsif  cookies.signed[:uuid] and Cart.find_by(product_id: id, uuid:cookies.signed[:uuid] )
      result = true
    end
     result
  end
  def is_in_wishlist(id)
    if current_user and current_user.wishes.find_by(product_id: id )
      true
    else
      false
    end
  end
  def current_user

    if cookies.signed[:user]
      hash = JSON.parse cookies.signed[:user]
      @current_user ||= User.find_by(id: hash['user_id'])
      if @current_user and @current_user.restore_date <= hash['time']
        return @current_user
      else
        return nil
      end
    else
      return  nil
    end
  end
  def is_valid_address
    !params[:suburb].blank? || !params[:county].blank? || !params[:street].blank? || !params[:city].blank? || !params[:state].blank? || !params[:country].blank? || !params[:zip].blank?
  end
end

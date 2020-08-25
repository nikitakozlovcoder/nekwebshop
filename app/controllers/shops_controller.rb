# controller for shop managing
# TODO DESIGN and implement actions functionality
class ShopsController < ApplicationController
  # products grid for specific store
  def index
    @shop = Shop.find(params[:id])
    @category = nil
    @data = nil
    query = []
    if params[:category_id]
      @category = Category.includes(:products, :makers).find params[:category_id]
      @data = JSON.parse @category.data if @category.is_template
      @products = []
      @makers = []
      t=[]
      @category.subtree.map do |el|
        t << el.id
      end
      @makers = Maker.includes(:categories).where(categories: {id: t})
      query << 'products.category_id in (' + t.join(', ') + ')'
    else
      @makers = nil
    end
    query << "products.shop_id in (#{params[:id]})"
    if !params[:search].blank?
      query << "products.title like '%#{params[:search]}%'"
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

    @template = []
    if @category and @category.is_template
      @template = JSON.parse @category.data
    end
    query2 = []
    @template.select{|el| el['type'] == "Number"}.each do |el|
      if !params[el['id'].to_s+"_min"].blank? && !params[el['id'].to_s+"_max"].blank?
        query2 << "(attributes.code = '#{el['id']}' and attributes.num BETWEEN '#{params[el['id'].to_s+"_min"]}' and '#{params[el['id'].to_s+"_max"]}')"
      elsif !params[el['id'].to_s+"_min"].blank?
        query2 << "(attributes.code = '#{el['id']}' and attributes.num >= '#{params[el['id'].to_s+"_min"]}')"
      elsif !params[el['id'].to_s+"_max"].blank?
        query2 << "(attributes.code = '#{el['id']}' and attributes.num <= '#{params[el['id'].to_s+"_max"]}')"
      end
    end
    query = query.join ' and '
    sum = query2.count
    query2 = query2.join ' or '
    pp query
    if sum == 0
      @products = Product.where(query).order(order).distinct
    else
      order_by = "ORDER BY products.title ASC"

      if params['order'] == 'price'
        order_by = "ORDER BY products.price ASC"
      end
      @products = Product.find_by_sql("
       SELECT DISTINCT * FROM products WHERE id IN (SELECT attr.product_id FROM
        (
          SELECT COUNT(id) AS QTY, product_id FROM attributes WHERE (#{query2}) GROUP BY product_id
        ) AS attr WHERE (attr.QTY = #{sum} and #{query})) #{order_by}
                                      ")
      @products = Product.where(id: @products.map(&:id))
    end


    if @products.count > 0
      if t
        @max_price = Product.where(category_id: t).max_by{|el| el.price}.price
        @min_price = Product.where(category_id: t).min_by{|el| el.price}.price
      else
        @max_price = Product.maximum(:price)
        @min_price = Product.minimum(:price)
      end
    end



  end
  def dashboard

  end
  def all
    @shops = Shop.all.sort_by(&:mark).reverse!
  end
end

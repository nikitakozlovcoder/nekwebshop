# controller for products
# TODO implement actions functionality

class ProductsController < ApplicationController
   #protect_from_forgery only: [:load]


  # all products grid
   def delete
     @shop = Shop.find_by!(id: params[:id], user_id: current_user)
     @product = @shop.products.find(params[:product_id])
     @product.destroy
     render json: true
   end
   def load_fields
     @product = Product.find params[:id]
     out ={}
     out[:category_id] = @product.category.id
     out[:maker_id] = @product.maker.id
     out[:custom_maker_name] = @product.maker_name
     out[:main_photo] = url_for(@product.main_photo)

     @product.fields.each do |field|
       out[field.code] = [field, []]
       if field.type_name == "Images" || field.type_name == "Videos" || field.type_name == "Files"

         field.files.each do |file|
           out[field.code][1] << url_for(file)
         end

       end
     end
     render json: out
   end
  def index
    show_products
  end

  def update
    redirect_to controller: 'users', action: 'sign_in' if !current_user
    if current_user
      @categories = Category.where(is_template: true )

      @shop = Shop.find(params[:shop_id])
      @product = @shop.products.find(params[:id])
      @category = @product.category
      @errors = []

      render :new
    end
  end

   def update_product
     @errors = []
     valid = true
     @shop = Shop.find_by!(id: params[:shop_id], user_id: current_user.id)
     @category = Category.find_by(id: params[:category])
     if @category && !@category.is_template
       @category = nil
     end
     if @category && params[:maker] != nil

       @maker = @category.makers.find(params[:maker])
     end

     name = params[:name]
     description = params[:description]
     main_photo = params[:main_photo]
     price = params[:price].to_f
     custom_maker = params[:custom_maker]
     @product = @shop.products.find params[:id]
     @product.title =  name ? name.strip : nil
     @product.price =  price
     @product.description =  description ? description.strip : nil
     @product.maker_name = nil
     @product.main_photo.attach(main_photo) if params[:main_photo_changed] == 'Yes'

     if (@maker && @maker.is_another)
       if custom_maker.strip() != ""
         @product.maker_name = custom_maker.strip()
       else
         valid = false
         @errors << "укажите производителя"
       end
     end
     quantity = params[:quantity]
     if params[:is_inf_quantity] == "on"
       quantity = 0
     end
     @product.maker = @maker
     @product.shop = @shop
     @product.is_inf_quantity = params[:is_inf_quantity] == "on"
     @product.category = @category
     @product.quantity = quantity
     data = nil
     if @category != nil
       data = JSON.parse @category.data
     end
     is_correct = is_correct_extra_fields data

     if (@product.valid? && is_correct && valid)
       @product.save
       data.each do |el|
         a = @product.fields.where(code: el['id']).first
         should_save = true

         unless a

           should_save = false
           a = Attribute.new
         end
         a.check = nil
         a.text = nil
         a.num = nil
         a.name = el['name']
         a.type_name = el['type']
         a.hint = el['hint']
         a.code = el['id']
         case el['type']
         when  "Images"
           if params[el['id'].to_s+'_changed'] == 'Yes'
             a.files.each {|file| file.purge}
             params[el['id'].to_s].each { |el| a.files.attach(el) } if params[el['id'].to_s] != nil
           end
         when "Videos"
           #TODO add
         when "Files"
           #TODO add
         when "Text", "LongText"
           a.files.each {|file| file.purge}
           a.text =  params[el['id'].to_s].strip
         when "Number"
           a.files.each {|file| file.purge}
           a.num =  params[el['id'].to_s].to_f
         when "Bool"
           a.files.each {|file| file.purge}
           a.check =  params[el['id'].to_s] == "on"
         end
          if should_save
            a.save
          else
            puts ""
            @product.fields << a
          end

       end
       @product.fields.where("code  > ?", data.last['id']).delete_all
       @shop.update_top_cat_on_add @product
       redirect_to action: 'show', id: @product.id
     else

       @categories = Category.where(is_template: true )
       render :new
     end
   end

  def show
    #TODO show files and videos
  	@product = Product.find params[:id]
    @posts = @product.posts.order('created_at DESC')
    @images = @product.fields.select{|el|  el.type_name == "Images" }
    @videos = @product.fields.select{|el|  el.type_name == "Videos" }
    @files = @product.fields.select{|el|  el.type_name == "Files" }
    @fields = @product.fields - @videos
    @fields = @fields - @files
    @fields = @fields - @images
    #pp @product.fields
    @page_title = @product.title
    @post = Post.new

  end
  # add new product

  def new
    redirect_to controller: 'users', action: 'sign_in' if !current_user
    if current_user
      @shop = Shop.find_by!(id: params[:id], user_id: current_user.id)
      @categories = Category.where(is_template: true )
      @product = Product.new
      @errors = []
    end
  end
  def create
    @errors = []
    valid = true
    @shop = Shop.find_by!(id: params[:id], user_id: current_user.id)
    @category = Category.find_by(id: params[:category])
    if @category && !@category.is_template
      @category = nil
    end
    if @category && params[:maker] != nil

      @maker = @category.makers.find(params[:maker])
    end

    name = params[:name]
    description = params[:description]
    main_photo = params[:main_photo]
    price = params[:price].to_f
    custom_maker = params[:custom_maker]

    @product = Product.new(title: name ? name.strip : nil, price:price, description: description ? description.strip : nil)
    @product.maker_name = nil
    @product.main_photo.attach(main_photo)

    if (@maker && @maker.is_another)
      if custom_maker.strip() != ""
        @product.maker_name = custom_maker.strip()
      else
        valid = false
        @errors << "укажите производителя"
      end
    end
    quantity = params[:quantity]
    if params[:is_inf_quantity] == "on"
      quantity = 0
    end
    @product.maker = @maker
    @product.shop = @shop
    @product.is_inf_quantity = params[:is_inf_quantity] == "on"
    @product.category = @category
    @product.quantity = quantity
    data = nil
    if @category != nil
      data = JSON.parse @category.data
    end
    is_correct = is_correct_extra_fields data

    if (@product.valid? && is_correct && valid)
      @product.save
      data.each do |el|

          a = Attribute.new

          a.name = el['name']
          a.type_name = el['type']
          a.hint = el['hint']
          a.code = el['id']
          case el['type']
          when  "Images"
            params[el['id'].to_s].each { |el| a.files.attach(el) } if params[el['id'].to_s] != nil
          when "Videos"
            #TODO add
          when "Files"
            #TODO add
          when "Text", "LongText"
            a.text =  params[el['id'].to_s].strip
          when "Number"
            a.num =  params[el['id'].to_s].to_f
          when "Bool"
            a.check =  params[el['id'].to_s] == "on"
          end

          @product.fields << a
      end
      @shop.update_top_cat_on_add @product
      redirect_to action: 'show', id: @product.id
    else

      @categories = Category.where(is_template: true )
      render :new
    end
  end
  # TODO add action for  viewing single product


  private

  def is_correct_extra_fields data

    blank = false
    valid = true
    if data == nil
      return valid
    end
    data.each do |el|

      if el['type'] != "Images" && el['type'] != "Bool"
        if (params[el['id'].to_s] == nil || params[el['id'].to_s].strip == ""  )
          blank = true
          valid = false
        else
          if !is_field_valid? el
            valid = false
          end
        end
      end
      if el['type'] == "Images"
        #TODO validation
      elsif el['type'] == "Videos"
        #TODO validation
      elsif el['type'] == "Files"
        #TODO validation
      end
    end
    if blank
      @errors << t('controllers.product.blank')
    end

    return  valid
  end

  def is_field_valid?(el)
    valid = true
    case el['type']
    when "Number"
      if el['max'] && params[el['id'].to_s].to_f > el['max']
        @errors << "Значение поля "+el['name']+" должно быть не больше "+el['max'].to_s
        valid =  false
      end
      if el['min'] && params[el['id'].to_s].to_f  < el['min']
        @errors << "Значение поля "+el['name']+" должно быть не меньше "+el['min'].to_s
        valid =  false
      end
      if el['is_int'] && params[el['id'].to_s].split('.').count != 1
        @errors << "Значение поля "+el['name']+" должно быть целым числом"
        valid = false
      end

    when "Text", "LongText"
      if el['max'] && params[el['id'].to_s].strip.length > el['max']
        @errors << "Количество символов поля "+el['name']+" должно быть не больше "+el['max'].to_s
        valid =  false
      end
      if el['min'] && params[el['id'].to_s].strip.length < el['min']
        @errors << "Количество символов поля "+el['name']+" должно быть не меньше "+el['min'].to_s
        valid =  false
      end
    end

    return  valid


  end

end

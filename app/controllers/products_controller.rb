# controller for products
# TODO implement actions functionality

class ProductsController < ApplicationController
   #protect_from_forgery only: [:load]


  # all products grid
  def index
    @products = Product.all
  end


  def show
  	@product = Product.find params[:id]

    @images = @product.fields.select{|el|  el.type_name == "Images" }
    @fields = @product.fields - @images
    #pp @product.fields
    @page_title = @product.title
  end
  # add new product

  def new

    @categories = Category.where(is_template: true )
    @product = Product.new
    @errors = []
  end
  def create
    @errors = []
    valid = true
    pp params
    @shop = Shop.find(params[:id])
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

    @product.main_photo.attach(main_photo)

    if (@maker && @maker.is_another)
      if custom_maker.strip() != ""
        @product.maker_name = custom_maker
      else
        valid = false
        @errors << "укажите производителя"
      end
    end

    @product.maker = @maker
    @product.shop = @shop
    @product.category = @category
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

          case el['type']
          when  "Images"
            if params[el['id'].to_s] == nil
              next
            end
            params[el['id'].to_s].each do |el|
                a.images.attach(el)
            end

          when "Text", "LongText"
            a.text =  params[el['id'].to_s].strip
          when "Number"
            a.num =  params[el['id'].to_s].to_f
          when "Bool"
            a.check =  params[el['id'].to_s] == "on"
          end

          @product.fields << a
      end

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

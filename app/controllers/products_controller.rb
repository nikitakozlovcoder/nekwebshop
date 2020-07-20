# controller for products
# TODO implement actions functionality

class ProductsController < ApplicationController
   #protect_from_forgery only: [:load]

  # all products grid
  def index

  end


  # add new product
  def new
    @categories = Category.all
  end
  def create

    @shop = Shop.find(params[:id])
    @category = Category.find_by(id: params[:category])

    if @category && params[:maker] != nil
      @maker = @category.makers.find(params[:maker])
    end

    name = params[:name]
    description = params[:description]
    main_photo = params[:main_photo]
    price = params[:price].to_f
    custom_maker = params[:custom_maker]

    @product = Product.new(title: name, price:price, description: description)

    @product.main_photo.attach(main_photo)

    if (@maker && @maker.is_another)
      @product.maker_name = custom_maker
    end

    @product.maker = @maker
    @product.shop = @shop
    @product.category = @category

    if (@product.save)
      data = JSON.parse @category.data
      data.each do |el|

        if el['type'] != "Images" && (params[el['id'].to_s] == "" || params[el['id'].to_s] == nil)
          @product.destroy
          flash.now[:error] = "Заполните все поля"

          render plain: "not valid!!"
          return
        else

          a = Attribute.new

          a.name = el['name']
          a.type_name = el['type']

          case el['type']
          when  "Images"
            a.images.attach params[el['id'].to_s]
          when "Text", "LongText"
            a.text =  params[el['id'].to_s]
          when "Number"
            a.num =  params[el['id'].to_s].to_f
          when "Bool"
            a.check =  params[el['id'].to_s] == "on"
          end

          @product.fields << a

        end
      end

      render plain: "hi!"
    else
      pp @product.errors
      render plain: "not valid!"
    end
  end
  # TODO add action for  viewing single product
end

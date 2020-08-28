# controller for cart
# TODO implement actions functionality
class CartController < ApplicationController
  def create_addr
    address = Address.new()
    address.suburb = params[:suburb]
    address.county = params[:county]
    address.street = params[:street]
    address.city = params[:city]
    address.state = params[:state]
    address.country = params[:country]
    address.zip = params[:zip]
    address.save
    address
  end
  def create_ordered_product cart
    t =   OrderedProduct.new
    t.main_photo = cart.product.main_photo.blob
    t.product = cart.product
    t.quantity = cart.quantity
    t.price = cart.product.price
    t.description = cart.product.price
    t.title = cart.product.title
    name = cart.product.maker_name
    name2 = cart.product.maker ? cart.product.maker.name : ''
    arr = []
    arr << {name: 'Производитель', value: name ? name : name2 , hint: ''}
    arr << {name: 'Категория', value: cart.product.category.name , hint: ''}
    cart.product.fields.each do |field|
      if field.type_name == "Number"
        hash={name: field.name, value: field.num , hint: field.hint}
      elsif field.type_name == "Bool"
        hash={name: field.name, value: field.check , hint: field.hint}
      elsif field.type_name == "Text" || field.type_name == "LongText"
        hash={name: field.name, value: field.text , hint: field.hint}
      end

      arr << hash
      t.data = JSON.generate arr
      return t
    end

  end
  # normal cart table
  def index
    get_carts
  end
  # make order
  def new
    get_carts
    @sum = 0
    @carts.each{|a| @sum+=a.product.price*a.quantity}
  end
  def create

    user_carts = get_carts.group_by{|a| a.product.shop_id}
    user_carts.each do |shop_id, carts|
      puts "USER!!!!!!!!!!!!!!"
      puts current_user
      order = Order.new
      order.name = params[:name]
      order.surname = params[:surname]
      order.phone = params[:phone]
      order.email = params[:email]
      order.shop_id = shop_id
      order.user = current_user if current_user
      order.address = create_addr
      carts.each{|el|
        order.ordered_products << create_ordered_product(el)
      }
      order.save
    end
    get_carts.destroy_all
  end
  def delete_cart
    hash = {success: false}
    if current_user
      hash[:success] = true
      current_user.carts.find(params[:id]).delete
    elsif cookies.signed[:uuid]
      hash[:success] = true
      Cart.find_by!(uuid:cookies.signed[:uuid], id: params[:id]).delete
    end
    render json: hash
  end
  def change_quantity
    hash = {success: false}
    if current_user && @cart = current_user.carts.find(params[:id])
        hash[:success] = true
        @cart.quantity = params[:quantity]
        @cart.save
    elsif cookies.signed[:uuid] && @cart = Cart.find_by!(uuid: cookies.signed[:uuid], id: params[:id])
      hash[:success] = true
      @cart.quantity = params[:quantity]
      @cart.save
    end
    render json: hash
  end
  def add
    @cart = Cart.new
    @cart.product = Product.find params[:id]
    @cart.quantity = 1
    hash = {success: false}

    if current_user
      hash[:success] = true
      if Cart.where(user_id: current_user.id, product_id: params[:id]).last
        render json: hash
        return
      end
      @cart.user = current_user
      @cart.save

    elsif cookies.signed[:uuid]
      hash[:success] = true
      if Cart.where(uuid: cookies.signed[:uuid], product_id: params[:id]).last
        render json: hash
        return
      end
      @cart.uuid = cookies.signed[:uuid]
      @cart.save

    else
      hash[:success] = true
      cookies.signed[:uuid] = SecureRandom.uuid
      @cart.uuid = cookies.signed[:uuid]
      @cart.save

    end
    render json: hash
  end
  private
  def get_carts
    if current_user
      @carts = current_user.carts.order(:created_at)
    elsif cookies.signed[:uuid]
      @carts = Cart.where(uuid:  cookies.signed[:uuid]).order(:created_at)
    else
      @carts = []
    end
  end
end

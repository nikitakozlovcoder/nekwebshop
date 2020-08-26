# controller for cart
# TODO implement actions functionality
class CartController < ApplicationController
  # normal cart table
  def index
    get_carts
  end
  # make order
  def new
    get_carts
    @sum = 0
    @carts.each{|a| @sum+=a.product.price}
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

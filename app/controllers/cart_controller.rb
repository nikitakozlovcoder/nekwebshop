# controller for cart
# TODO implement actions functionality
class CartController < ApplicationController
  # normal cart table
  def index
    if current_user
      @carts = current_user.carts
    elsif cookies.signed[:uuid]
      @carts = Cart.where(uuid:  cookies.signed[:uuid])
    else
      @carts = []
    end
  end
  # make order
  def new


  end
  def wishlist

  end

  def add
    @cart = Cart.new
    @cart.product = Product.find params[:id]
    @cart.quantity = 1
    hash = {succsess: false}

    if current_user
      hash[:succsess] = true
      if Cart.where(user_id: current_user.id, product_id: params[:id]).last
        render json: hash
        return
      end
      @cart.user = current_user
      @cart.save

    elsif cookies.signed[:uuid]
      hash[:succsess] = true
      if Cart.where(uuid: cookies.signed[:uuid], product_id: params[:id]).last
        render json: hash
        return
      end
      @cart.uuid = cookies.signed[:uuid]
      @cart.save

    else
      hash[:succsess] = true
      cookies.signed[:uuid] = SecureRandom.uuid
      @cart.uuid = cookies.signed[:uuid]
      @cart.save

    end
    render json: hash
  end
end

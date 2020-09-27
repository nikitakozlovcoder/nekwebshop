class WishesController < ApplicationController
  def index
    if current_user
      @wishes = current_user.wishes
    else
      redirect_to controller: 'users', action: 'sign_in'
    end
  end
  def add
    hash = {success: false}
    if current_user
      hash[:success] = true
      if !current_user.wishes.find_by(product_id: params[:id])
        @wish = Wish.new
        @wish.user = current_user
        @wish.product = Product.find params[:id]
        @wish.save
      end
    end
    render json: hash
  end
  def delete
    hash = {success: false}
    if current_user
      hash[:success] = true
      current_user.wishes.find(params[:id]).delete
    end
    redirect_to controller: 'wishes', action: 'index'
  end
end

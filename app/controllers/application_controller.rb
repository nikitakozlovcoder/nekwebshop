class ApplicationController < ActionController::Base
  skip_forgery_protection
  helper_method  :all_categories
  helper_method  :current_user
  helper_method  :is_in_cart
  def all_categories
    Category.all
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
  def current_user

    if cookies.signed[:user]
      hash = JSON.parse cookies.signed[:user]
      @current_user ||= User.find(hash['user_id'])
      if @current_user and @current_user.restore_date <= hash['time']
        return @current_user
      else
        return nil
      end
    else
      return  nil
    end
  end
end

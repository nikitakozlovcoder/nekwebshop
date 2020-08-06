class ApplicationController < ActionController::Base
  skip_forgery_protection
  helper_method  :all_categories
  helper_method  :current_user
  def all_categories
    Category.all
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

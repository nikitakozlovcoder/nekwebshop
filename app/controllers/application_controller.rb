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
      return  @current_user ||= User.find(hash['user_id'])
    else
      return  nil
    end
  end
end

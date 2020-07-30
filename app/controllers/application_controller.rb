class ApplicationController < ActionController::Base
  skip_forgery_protection
  helper_method  :all_categories
  helper_method  :current_user
  def all_categories
    Category.all
  end

  def current_user
    @current_user ||= User.find(cookies[:user_id]) if cookies[:user_id]
  end
end

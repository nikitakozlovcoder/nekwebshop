class ApplicationController < ActionController::Base
  skip_forgery_protection
  helper_method  :all_categories
  def all_categories
    Category.all
  end
end

class CategoriesController < ApplicationController

  def show
    render json: Category.find_by(id: params[:id])
  end
end

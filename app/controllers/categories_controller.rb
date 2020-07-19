class CategoriesController < ApplicationController

  def show
    c = Category.find_by(id: params[:id])
    output = {}
    if c == nil
      output = nil
    else
      makers = c.makers
      output[:makers] = makers
      output[:category] = c
    end

    render json: output
  end
end

# controller for products
# TODO implement actions functionality

class ProductsController < ApplicationController
   #protect_from_forgery only: [:load]

  # all products grid
  def index

  end

  def show
  	
  end
  # add new product

  def new
    @categories = Category.all
  end
  # TODO add action for  viewing single product
end

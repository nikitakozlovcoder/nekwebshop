# controller for shop managing
# TODO DESIGN and implement actions functionality
class ShopsController < ApplicationController
  # products grid for specific store
  def index

    @shop = Shop.find(params[:id])
    show_products "products.shop_id in (#{params[:id]})"


  end
  def dashboard

  end
  def all
    @shops = Shop.all.sort_by(&:mark).reverse!
  end
end

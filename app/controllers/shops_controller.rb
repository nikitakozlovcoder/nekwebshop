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
    if !params[:order] or params[:order] == 'mark'
      @shops = Shop.all.sort_by{|a| [-a.mark, a.name]}
    elsif params[:order] == 'name'
     # @shops = Shop.all.order('LOWER(name) ASC')
       @shops = Shop.all.sort_by{|a| [a.name, -a.mark]}
    elsif params[:order] == 'qty'
      #@shops = Shop.joins('LEFT JOIN products ON (shops.id = products.shop_id)').group('shops.id').order('count(products.id) DESC')
        @shops = Shop.all.sort_by{|a| [a.products.count, a.mark]}.reverse!
    end

  end
end

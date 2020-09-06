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
    @shops  = Shop.all
    if params[:mark] and params[:mark].to_i > 0
      @shops = @shops.filter{|a| a.mark >= params[:mark].to_i}
    end
    if !params[:order] or params[:order] == 'mark'
      @shops = @shops.sort_by{|a| [-a.mark, a.name]}
    elsif params[:order] == 'name'
     # @shops = Shop.all.order('LOWER(name) ASC')
       @shops = @shops.sort_by{|a| [a.name, -a.mark]}
    elsif params[:order] == 'qty'
      #@shops = Shop.joins('LEFT JOIN products ON (shops.id = products.shop_id)').group('shops.id').order('count(products.id) DESC')
        @shops = @shops.sort_by{|a| [a.products.count, a.mark]}.reverse!
    end

  end
end

# controller for shop managing
# TODO DESIGN and implement actions functionality
class ShopsController < ApplicationController
  # products grid for specific store
  def create_addr
    address = Address.new()
    address.suburb = params[:suburb]
    address.county = params[:county]
    address.street = params[:street]
    address.city = params[:city]
    address.state = params[:state]
    address.country = params[:country]
    address.zip = params[:zip]
    address.save
    address
  end
  def index

    @shop = Shop.find(params[:id])
    show_products "products.shop_id in (#{params[:id]})"


  end
  def dashboard

  end

  def profile

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
  def new
    redirect_to controller: 'users', action: 'sign_in'
    @errors = []
    @shop = Shop.new
  end
  def create
    @errors = []
    @shop = Shop.new
    if params[:suburb].blank? || params[:county].blank? || params[:street].blank? || params[:city].blank? || params[:state].blank? || params[:country].blank? || params[:zip].blank?
      @errors << "Введите полный адрес"
    end

    @shop.address = create_addr
    @shop.name = params[:name]
    @shop.mail = params[:mail]
    @shop.phone = params[:phone]
    @shop.description = params[:description]
    @shop.main_photo = params[:main_image]

    if @shop.valid? and @errors.count == 0
      @shop.save
      redirect_to :profile
    else
      render :new
    end
  end
end

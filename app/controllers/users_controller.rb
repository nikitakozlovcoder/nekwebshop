# controller for user logging, registration, and account management
# there will also be functionality for creating a new store.
# TODO implement actions functionality
class UsersController < ApplicationController

  def sign_in
    @login = nil
    @errors = []
  end
  def restore
    @submitted = false
    @errors = []
    @main = nil
  end
  def restore_mail
    @errors = []
    @submitted = false
    @mail = params[:mail]
    @user = User.find_by(email: @mail, confirmed: true)
    if @user
      code = SecureRandom.hex(10)
      time = Time.now.getutc
      @user.skip_pass = true
      @user.restore_code = code
      @user.restore_code_task_started = time
      @user.save
      @submitted = true
      UserMailer.with(user: @user, url: request.base_url+"/user/#{@user.id}/restore/"+code).restore.deliver_later


      UserClearCodeJob.set(wait: 10.minutes).perform_later(@user, time)
      render :restore
    else
      @errors << "Не найден пользователь с данным адресом электронной почты"
      render :restore
    end
  end

  def restore_link
    @user = User.new
  end
  def restore_link_post
    @user = User.find_by(id: params[:id], confirmed: true)
    if @user and !@user.nil? and @user.restore_code and @user.restore_code == params[:code]

      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      @user.restore_date = Time.now.getutc
      @user.restore_code_task_started = nil
      @user.restore_code = nil
      if @user.save
        redirect_to :sign_in
      else
        render :restore_link
      end
    else
      @invalid_code = true
      render :restore_link
    end
  end
  def restore_mobile
    hash = {success: true, errors: []}

    if params['step'] == '1'

      @user = User.find_by(phone: params['phone'])
      if @user
        render json:hash
      else
        hash[:success] = false
        hash[:errors] << "пользователь не найден"
        render json:hash
      end
    elsif params['step'] == '2'
      @user = User.find_by(phone: params['phone'])
      if !@user
        hash[:success] = false
        hash[:errors] << "пользователь не найден"
        render json:hash
        return
      end
      @user.password = params[:password]
      if !params[:password_confirmation]
        params[:password_confirmation] = ""
      end
      @user.password_confirmation = params[:password_confirmation]
      #TODO check code
      if (@user.valid?)
        @user.restore_date = Time.now.getutc
        @user.save
        render json:hash
      else
        hash[:success] = false
        hash[:errors] << @user.errors.messages[:password]
        hash[:errors] << @user.errors.messages[:password_confirmation]
        hash[:errors].flatten!
        render json:hash
      end
    end
  end
  def exit
    cookies.signed[:user] = nil
    cookies.signed[:uuid] = nil
    redirect_back(fallback_location: root_path)
  end

  def sign_in_post
    @login = params[:login]
    @password = params[:password]

    @error = false

    @user = User.where(phone: @login).or(User.where(email: @login)).first
    pp @user
    if @user && @user.authenticate(@password)
      fill_cart
      @error = false
      hash = {}
      hash[:user_id] = @user.id
      hash[:time] = Time.now.getutc
      cookies.signed[:uuid] = nil
      if params[:remember] == "on"
        cookies.signed[:user] = {value: JSON.generate(hash), expires: 30.days}
      else
        cookies.signed[:user] = {value: JSON.generate(hash), expires: nil}
      end
      redirect_to controller: 'home', action: 'index'
    else

      @error = true
      render :sign_in
    end
  end

  def confirm
    user = User.find_by(id: params[:id], restore_code: params[:code], confirmed: false)
    @err = nil
    if !user
      @err = 1
      render :confirm
    elsif User.find_by(email: user.email, confirmed: true)
      @err = 2
        render :confirm
    else
      user.skip_pass = true
      user.confirmed = true
      user.restore_code = nil
      user.save
      redirect_to action: 'sign_in'
    end


  end
  def create
    @success = false
    @errors = []
    #phone: params[:phone].delete("^0-9")
    @user = User.new(email: params[:email], password_confirmation: params[:pass], name: params[:name], surname: params[:surname])
    @errors << 'адрес электронной почты уже используется, выполните вход или восстановите пароль' if User.find_by(email: @user.email, confirmed: true)
    @user.password = params[:password]
    @user.restore_date = Time.now.getutc
    @user.suburb = params[:suburb]
    @user.county = params[:county]
    @user.street = params[:street]
    @user.city = params[:city]
    @user.state = params[:state]
    @user.country = params[:country]
    @user.zip = params[:zip]
    @user.confirmed = false
    if params[:suburb].blank? || params[:county].blank? || params[:street].blank? || params[:city].blank? || params[:state].blank? || params[:country].blank? || params[:zip].blank?
      @errors << "Введите полный адрес"
    end
    if  @user.valid? and @errors.count <= 0
      puts "SAVEDUSER"
      code = SecureRandom.hex(10)
      time = Time.now.getutc
      @user.restore_code_task_started = time
      @user.restore_code = code
      @user.save
      @success = true
      UserMailer.with(user: @user, url: request.base_url+"/user/#{@user.id}/confirm/"+code).confirm.deliver_later
      UserClearCodeJob.set(wait: 7.days).perform_later(@user, time)
    end
    render :registration
  end
  def registration
    @success = false
    @errors = []
    @user = User.new
  end
  # TODO and actions for:
  # registration
  # login
  # profile -> (from here user will be prompted to create a new store, idk we need additional page and action for it)
  #
  private

  def fill_cart
    puts "hi!"
    @temp = []
    @temp = Cart.where(uuid: cookies.signed[:uuid]) if cookies.signed[:uuid]
    @db = @user.carts
    @temp.each do |el|
      if @db.where(product_id: el.product.id).last
        puts "1111111111111111111111111"
        el.delete
      else
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!"
        el.uuid = nil
        @user.carts << el
      end
    end
  end
end

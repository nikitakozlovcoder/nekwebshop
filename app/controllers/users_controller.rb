# controller for user logging, registration, and account management
# there will also be functionality for creating a new store.
# TODO implement actions functionality
class UsersController < ApplicationController
  before_action :require_login, only: [:profile, :password_change, :profile_change]
  def orders
    redirect_to controller: 'users', action: 'sign_in' if !current_user
  end
  def require_login
    unless current_user
      redirect_to :sign_in
    end
  end
  def profile
    @errors_main = []


    @user = User.find(current_user.id)
    @old_user = @user


  end
  def password_change

    @errors_main = []

    @user = User.find(current_user.id)
    @old_user = @user
    if @user.authenticate(params[:old_password])
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
        if !@user.save
          flash[:errors_password] = []
          flash[:errors_password] <<  @user.errors.messages[:password]
          flash[:errors_password] <<  @user.errors.messages[:password_confirmation]
        end
    else
      flash[:errors_password] = []
       flash[:errors_password]  << ['Введен неверный пароль']
      end

      redirect_to :profile
  end

  def profile_change
    @errors_main = []

    @user = User.find(current_user.id)
    @old_user =  User.find(current_user.id)
    @user.skip_pass = true
    @user.avatar.attach(params[:main_photo]) if params[:main_photo_changed] == "Yes"
    @user.name = params[:name]
    @user.third_name = params[:third_name]
    @user.email_temp = params[:email]
    @user.surname = params[:surname]
    @user.suburb = params[:suburb]
    @user.county = params[:county]
    @user.street = params[:street]
    @user.city = params[:city]
    @user.state = params[:state]
    @user.country = params[:country]
    @user.phone = params[:phone]
    @user.zip = params[:zip]
    if !is_valid_address
      @errors_main << ["Введите адрес"]
    end
    @user.should_validate_temp_mail = true
    if @user.valid? and @errors_main.count == 0
      if(@user.email != @user.email_temp)
        code = SecureRandom.hex(10)
        time = Time.now.getutc
        @user.email_temp_code = code
        @user.change_code_task_started = time
        UserMailer.with(user: @user, url: request.base_url+"/user/#{@user.id}/change/"+code).change.deliver_later
        UserClearTempCodeJob.set(wait: 10.minutes).perform_later(@user, time)
        @mail_change = true
      end

      @user.save
      @old_user = @user

    else
      @errors_main << @user.errors.messages[:name]
      @errors_main << @user.errors.messages[:surname]
      @errors_main << @user.errors.messages[:email_temp]
      @errors_main << @user.errors.messages[:phone]
      pp @errors_main

    end
    render :profile
  end
  def update_mail
    @user = User.find_by(id: params[:id], email_temp_code: params[:code] )
    if @user and @user.email_temp != nil and @user.email_temp_code != nil
      @temp = User.find_by(email: @user.email_temp)
      if @temp
        render :update_mail
      else
        @user.skip_pass = true
        @user.email = @user.email_temp
        @user.email_temp = @user.email_temp_code = nil
        @user.change_code_task_started = nil
        @user.save
        redirect_to :profile
      end
    else
      render :update_mail
    end

  end
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

    @user = User.where(phone: @login, confirmed: true).or(User.where(email: @login, confirmed: true)).first
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
    @user = User.new(email: params[:email], password_confirmation: params[:pass], name: params[:name], surname: params[:surname], third_name: params[:third_name])
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
    if !is_valid_address
      @errors << "Введите адрес"
    end
    if  @user.valid? and @errors.count <= 0
      code = SecureRandom.hex(10)
      time = Time.now.getutc
      @user.restore_code_task_started = time
      @user.restore_code = code
      @user.save
      @success = true
      cookies.signed[:temp_id] = @user.id
      UserMailer.with(user: @user, url: request.base_url+"/user/#{@user.id}/confirm/"+code).confirm.deliver_later
      UserClearCodeJob.set(wait: 7.days).perform_later(@user, time)
    end
    render :registration
  end
  def change_mail
    @success = true
    @errors = []
    if cookies.signed[:temp_id]
      @user = User.find_by(id: cookies.signed[:temp_id], confirmed: false)
      if @user
        @user.skip_pass = true
        @user.email = params[:email]
        code = SecureRandom.hex(10)
        time = Time.now.getutc
        @user.restore_code_task_started = time
        @user.restore_code = code
        @user.save
        UserMailer.with(user: @user, url: request.base_url+"/user/#{@user.id}/confirm/"+code).confirm.deliver_later
        UserClearCodeJob.set(wait: 7.days).perform_later(@user, time)
      end
    else
      @user = User.new
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
    @temp = []
    @temp = Cart.where(uuid: cookies.signed[:uuid]) if cookies.signed[:uuid]
    @db = @user.carts
    @temp.each do |el|
      if @db.where(product_id: el.product.id).last
        el.delete
      else
        el.uuid = nil
        @user.carts << el
      end
    end
  end
end

# controller for user logging, registration, and account management
# there will also be functionality for creating a new store.
# TODO implement actions functionality
class UsersController < ApplicationController

  def sign_in
    @login = nil
    @errors = []
  end
  def restore

  end
  def restore_mail

  end

  def restire_link

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
    redirect_back(fallback_location: root_path)
  end

  def sign_in_post
    @login = params[:login]
    @password = params[:password]

    @error = false

    @user = User.where(phone: @login).or(User.where(email: @login)).first
    pp @user
    if @user && @user.authenticate(@password)
      @error = false
      redirect_to controller: 'home', action: 'index'
      hash = {}
      hash[:user_id] = @user.id
      hash[:time] = Time.now.getutc
      if params[:remember] == "on"
        cookies.signed[:user] = {value: JSON.generate(hash), expires: 30.days}
      else
        cookies.signed[:user] = {value: JSON.generate(hash), expires: nil}
      end

    else

      @error = true
      render :sign_in
    end
  end

  def create
    @errors = []
    #phone: params[:phone].delete("^0-9")
    @user = User.new(email: params[:email], password_confirmation: params[:pass], name: params[:name], surname: params[:surname])
    @user.password = params[:password]
    if @user.save
      redirect_to :sign_in
    else
      render :registration
    end
  end
  def registration
    @errors = []
    @user = User.new
  end
  # TODO and actions for:
  # registration
  # login
  # profile -> (from here user will be prompted to create a new store, idk we need additional page and action for it)
end

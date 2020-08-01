# controller for user logging, registration, and account management
# there will also be functionality for creating a new store.
# TODO implement actions functionality
class UsersController < ApplicationController

  def sign_in
    @login = nil
    @errors = []
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

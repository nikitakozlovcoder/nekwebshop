# controller for user logging, registration, and account management
# there will also be functionality for creating a new store.
# TODO implement actions functionality
class UsersController < ApplicationController

  def sign_in

  end
  def create
    @errors = []
    #phone: params[:phone].delete("^0-9")
    @user = User.new(email: params[:email], password_confirmation: params[:pass])
    @user.password = params[:password]
    if @user.save
      redirect :sign_in
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

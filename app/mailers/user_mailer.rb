class UserMailer < ApplicationMailer
  def restore
    @user = params[:user]
    @url =  params[:url]

    mail(to: @user.email, subject: 'Восставновление пароля')
  end

  def confirm
    @user = params[:user]
    @url =  params[:url]

    mail(to: @user.email, subject: 'Подтвержение адреса электронной почты')
  end

  def change
    @user = params[:user]
    @url =  params[:url]

    mail(to: @user.email_temp, subject: 'Подтвержение адреса электронной почты')
  end
end

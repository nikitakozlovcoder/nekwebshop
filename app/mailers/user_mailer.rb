class UserMailer < ApplicationMailer
  def restore
    @user = params[:user]
    @url =  params[:url]

    mail(to: @user.email, subject: 'Восставновление пароля')
  end
end

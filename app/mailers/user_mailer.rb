class UserMailer < ApplicationMailer
  def restore
    @user = params[:user]
    @url =  params[:url]

    mail(to: @user.email, subject: 'Восставновление пароля')
  end

  def confirm
    puts "MailDeliver!"
    @user = params[:user]
    @url =  params[:url]

    mail(to: @user.email, subject: 'Подтвержение адреса электронной почты')
  end
end

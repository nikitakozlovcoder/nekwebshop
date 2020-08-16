# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def restore
    user = User.first
    UserMailer.with(user: user, url: '124124qwfwqarqw124').restore
  end
end

class WelcomeMailer < ApplicationMailer

  default from: "checkammadbaig@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome To Bloggers!')
  end

end

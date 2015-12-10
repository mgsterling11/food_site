class UserMailer < ApplicationMailer
  default from: "flatironfoodies@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://www.getcookin.com'
    mail(to: @user.email, subject: "Let's get cookin', good lookin'!")
  end

end

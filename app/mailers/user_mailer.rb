class UserMailer < ApplicationMailer
  default from: "flatironfoodies@gmail.com"

   def welcome_email(user)
    binding.pry
    @user = user
    @url  = 'get-cookin.herokuapp.com/'
    mail(to: @user.email, subject: "Let's get cookin', good lookin'!")
  end
end

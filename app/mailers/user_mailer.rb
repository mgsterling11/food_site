class UserMailer < ApplicationMailer
  default from: "flatironfoodies@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'get-cookin.herokuapp.com/'
    mail(to: @user.email, subject: "Let's get cookin', good lookin'!")
  end

  def email_recipe(recipe, current_user)
    @user = current_user
    @recipe = recipe
    @proportions = recipe.proportions
    binding.pry
    mail(to: @user.email, subject: "Your shopping list for #{recipe.name}")
  end

end

class ShoppingListsController < ApplicationController

  def index
  end
  
  def show
    recipe = Recipe.find(params[:recipe_id])
    UserMailer.email_recipe(recipe, current_user).deliver_now
    redirect_to recipes_path
  end
end

class ShoppingListsController < ApplicationController

  def index
  end
  
  def show
    recipe = Recipe.find(params[:recipe_id])
    UserMailer.email_recipe(recipe, current_user).deliver_now
    redirect_to recipes_path
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @shopping_list_view_object = ShoppingListViewObject.new(@recipe)
    render 'shopping_list/show'
  end
end

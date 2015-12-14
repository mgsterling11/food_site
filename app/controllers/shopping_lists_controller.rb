class ShoppingListsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @shopping_list_view_object = ShoppingListViewObject.new(@recipe)
    render 'shopping_list/show'
  end
end

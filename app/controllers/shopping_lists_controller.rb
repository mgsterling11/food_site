class ShoppingListsController < ApplicationController
  def index
    binding.pry
  end

  def show
    binding.pry
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @shopping_list_view_object = ShoppingListViewObject.new(@recipe)
    render 'shopping_list/show'
  end
end

class ShoppingListsController < ApplicationController
  def index
    binding.pry
  end

  def show
    binding.pry
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @proportions = @recipe.proportions
    @shopping_list_view_object = ShoppingListViewObject.new(@recipe, @proportions)
    render 'shopping_list/show'
  end
end


# id: 55,
# unit_id: 5,
# ingredient_id: 118,
# quantity: 1.0,
# recipe_id: 4,
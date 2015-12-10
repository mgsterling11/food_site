class ShoppingListViewObject
  attr_reader :proportions, :recipe

  def initialize(recipe, proportions)
    @recipe = recipe
    @proportions = proportions
  end

  def ingredients_list
    binding.pry
    a = @proportions.map { |ingredient| Ingredient.find (ingredient.id) }
  end

end
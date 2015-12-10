class ShoppingListViewObject
  attr_reader :proportions, :recipe

  def initialize(recipe, proportions)
    @recipe = recipe
    @proportions = proportions
  end

  def list_ingredients_and_quantities
    binding.pry
  end

  def list_ingredients_and_proportions
    ingredients = @proportions.map { |ingredient| Ingredient.find (ingredient.id) }
    proportions = @proportions.map { |proportion| Ingredient.find (ingredient.id) }
  end

  def created_by
    if recipe.user
      "From #{recipe.user.name}'s Kitchen"
    elsif recipe.note
      "From the Food Network Collection: #{recipe.note}"
    end
  end

  def image_alt
    if recipe.image_url == "default_photo.jpg"
      "Credit: Free Food Photos"
    else
      recipe.name
    end
  end

  def image_url
    if recipe.image_url
      recipe.image_url
    else
      "default_photo.jpg"
    end
  end

  def categories_class
    recipe.categories.map(&:id).join(' ')
  end
end
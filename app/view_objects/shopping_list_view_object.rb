class ShoppingListViewObject
  attr_reader :proportions, :recipe

  def initialize(recipe, proportions)
    # @recipe = recipe
    # @proportions = proportions
    @ingredients = list_ingredients_and_quantities(proportions)
    @units = proportions
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


  def unit
    if proportion.unit
      @unit = proportion.unit.name
    else
      @unit = ""
    end
  end

  def quantity_conversion(quantity)
    conversions = { 0.125 => "1/8", 0.25 => "1/4", 0.333 => "1/3", 0.667 => "2/3", 0.5 => "1/2", 0.75 => "3/4" }
    if quantity == 0.0
      ""
    elsif quantity.to_i == quantity
      quantity.to_i
    elsif conversions.keys.include?(quantity)
      conversions[quantity]
    elsif quantity
      quantity.round(3)
    end   
  end

  def quantity
    quantity_conversion(original_quantity)
  end

  def display
    "#{quantity} #{unit} #{ingredient}"
  end
end
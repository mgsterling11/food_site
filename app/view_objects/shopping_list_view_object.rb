class ShoppingListViewObject
  attr_reader :proportions, :recipe, :ingredients, :units, :quantities

  def initialize(recipe)
    @ingredients = list_ingredients(recipe.ingredients)
    @units = list_units(recipe.proportions)
    @quantities = quantity_conversion(recipe.proportions)
  end

  def list_ingredients(ingredients)
    ingredients.map { |ingredient| Ingredient.find (ingredient.id) }
  end

  def list_units(proportions)
    proportions.map do |proportion| 
      if proportion.unit_id != nil
        proportion.unit.name  
      end
    end
  end

  def quantity_conversion(proportions)
    conversions = { 0.125 => "1/8", 0.25 => "1/4", 0.333 => "1/3", 0.667 => "2/3", 0.5 => "1/2", 0.75 => "3/4" }
    proportions.map do |proportion|      
      if proportion.quantity == 0.0
        ""
      elsif proportion.quantity.to_i == proportion.quantity
        proportion.quantity.to_i
      elsif conversions.keys.include?(proportion.quantity)
        conversions[proportion.quantity]
      elsif proportion.quantity
        proportion.quantity.round(3)
      end
    end
  end

  def display
    line_items = []
    x = 0
    while x < ingredients.length
      line_items.push("#{@quantities[x]} #{@units[x]} #{@ingredients[x].name}")
      x += 1
    end
    line_items
  end

end
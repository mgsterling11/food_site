# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string
#  view_count :integer
#  public     :boolean
#  user_id    :integer
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :favorites
  has_many :proportions
  has_many :ingredients, through: :proportions
  has_many :units, through: :proportions
  has_many :steps
  accepts_nested_attributes_for :steps
  accepts_nested_attributes_for :proportions
  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :units
  accepts_nested_attributes_for :categories
  validates_presence_of :name
  validates_length_of :proportions, minimum: 1
  validates_length_of :steps, minimum: 1

  def self.search_by_user_permissions(search, current_user)
    joins(:ingredients).where("((lower(recipes.name) like ? OR ingredients.name like ? ) AND public_recipe = ?) OR ((lower(recipes.name) like ? OR ingredients.name like ? ) AND user_id = ?)", search, search, true, search, search, current_user.id).uniq
  end

  def self.find_recipes(current_user)
    where("public_recipe = true OR user_id = #{current_user.id}")
  end

  def create_proportion(proportion, ingredient, unit)
    @proportion = self.proportions.build(proportion)
    @proportion.ingredient = Ingredient.find_or_create_by(ingredient)
    @proportion.unit = build_unit_for_recipe_proportion(unit)
    @proportion.save
    @proportion
  end

  def build_unit_for_recipe_proportion(unit)
    if unit[:name].length > 0
      Unit.find_or_create_by(unit)
    else
      nil
    end
  end

  def create_recipe_from_food_network_adapter(url)
    client = Adapters::RecipeClient.new
    client.create_recipe(url)
  end
end

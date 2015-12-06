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
  validates_presence_of :name, :proportions, :steps


###### ADD LATER TO ENSURE INPUT TO DATABASE IS CORRECT ######
  # ,reject_if: proc {|attributes| attributes[:name].blank?}
#######################

  def self.find_recipes(current_user)
    Recipe.where("public_recipe = ? OR user_id = ?", true, current_user.id)
  end

  def create_proportion(proportion, ingredient, unit)
    @proportion = self.proportions.build(proportion)
    @proportion.ingredient = Ingredient.find_or_create_by(ingredient)
    @proportion.unit = build_unit_for_recipe_proportion(unit)
    @proportion.save
  end

  def build_unit_for_recipe_proportion(unit)
    if unit[:name].length > 0
      Unit.find_or_create_by(unit)
    else
      nil
    end
  end

  def test_scrape(url)
    client = Adapters::RecipeClient.new
    client.create_recipe(url)
  end
end

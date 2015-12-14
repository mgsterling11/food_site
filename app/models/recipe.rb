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
  accepts_nested_attributes_for :categories
  validates_presence_of :name
  validates_length_of :proportions, minimum: 1
  validates_length_of :steps, minimum: 1

  def self.most_favorited(num)
    joins(:favorites).select('recipes.*, count(favorites.id) as fav_count').group('recipes.id').order('fav_count desc').limit(num)
  end

  def self.search_by_user_permissions(search, current_user)
    joins(:ingredients).where("((lower(recipes.name) like ? OR ingredients.name like ? ) AND public_recipe = ?) OR ((lower(recipes.name) like ? OR ingredients.name like ? ) AND user_id = ?)", search, search, true, search, search, current_user.id).uniq
  end

  def self.find_recipes(current_user)
    where("public_recipe = true OR user_id = #{current_user.id}")
  end

  def self.num_of_ingredient
    joins(:ingredients).group('ingredients.name').order('count_id desc').count('id')
  end

  def self.most_viewed(num)
    select('recipes.*').order('view_count desc').limit(num)
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

  def categories_attributes=(params)
    params.each do |key, category_value|
      if category_value[:id] != ""
        self.categories.push(Category.find category_value[:id])
      end
    end
  end  


end

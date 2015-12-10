# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  has_many :ingredients, through: :recipes
  validates_presence_of :name

#join recipes
#find category with highest recipe count

  def self.top_categories(num)
    joins(:recipes).select('categories.*, count(recipes.id) as most_common_category').group('categories.id').order('most_common_category desc').limit(num)
  end

  def self.top_search_categories(search, current_user, num)
    recipes = Recipe.search_by_user_permissions(search, current_user)
     binding.pry
    Category.joins(:recipes).select('recipes.*, count(categories.id)').where(:recipes => recipes.ids).group('categories.id').order('most_common_category desc').limit(num)


     # Category.joins(:recipes).select('categories.*, count(recipes.id) as most_common_category').group('categories.id').order('most_common_category desc').where(:recipes => recipes).limit(num)
  end

# Recipe.all.joins(:ingredients).where("((lower(recipes.name) like ? OR ingredients.name like ? ) AND public_recipe = ?) OR ((lower(recipes.name) like ? OR ingredients.name like ? ) AND user_id = ?)", "chicken", "chicken", true, "chicken", "chicken", 20).uniq

# joins(:favorites).select('recipes.*, count(favorites.id) as fav_count').group('recipes.id').order('fav_count desc').limit(num)



end

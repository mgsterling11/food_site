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

  def self.top_categories(num)
    joins(:recipes).select('categories.*, count(recipes.id) as most_common_category').group('categories.id').order('most_common_category desc').limit(num)
  end
end

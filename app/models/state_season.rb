class StateSeason < ActiveRecord::Base
  belongs_to :state
  belongs_to :season
  has_many :state_season_ingredients
  has_many :ingredients, through: :state_season_ingredients

  def self.this_months_ingredients(seasons)
    seasons.map {|season| season.ingredients }
  end

end

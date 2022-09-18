class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def total_calorie_count
    dish_ingredients.joins(:ingredient).sum(:calories)
  end

  def self.list_ingredients_uniq
    self.select("ingredients.name as ing_name").joins(:ingredients).distinct
  end

  def self.list_ingredients_uniq_ordered
    self.joins(:ingredients).group("ingredients.name").limit(3).count
  end
end
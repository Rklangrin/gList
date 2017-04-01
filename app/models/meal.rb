class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_items
  has_many :ingredients, through: :meal_items

  def ingredients_array
    arr = []
    self.meal_items.each do |item|
      arr << { name: item.ingredient.name, unit: item.ingredient.unit_type, quantity: item.quantity }
    end
    return arr
  end

end

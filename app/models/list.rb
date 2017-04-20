class List < ApplicationRecord

  belongs_to :user
  has_many :list_meals
  has_many :meals, through: :list_meals
  has_many :meal_items, through: :meals
  has_many :ingredients, through: :meal_items

  validates_presence_of :name

  def contains_meal?(meal)
    contains_meal = false
    self.meals.each do |list_meal|
      if list_meal.id == meal.id 
        contains_meal = true
      end
    end
    contains_meal
  end

  # def generate
  #   uniq_ingred = self.get_unique_ingredients
  #   quantities_hash = self.get_quantities
  #   list = []
  #   uniq_ingred.each do |ingredient|
  #     list << [ingredient.name, ingredient.unit_type, quantities_hash[ingredient.name]]
  #   end
  #   list
  # end

  # def get_quantities
  #   quantities_hash = {}
  #   self.meals.each do |meal|
  #     meal.list_items.each do |list_item|
  #       if quantities_hash.has_key?(list_item.ingredient.name)
  #         quantities_hash[list_item.ingredient.name] += list_item.quantity
  #       else
  #         quantities_hash[list_item.ingredient.name] = list_item.quantity
  #       end
  #     end
  #   end
  #   quantities_hash
  # end

  # def get_unique_ingredients
  #   unique_ingredients = []
  #   self.meals.each do |meal|
  #     meal.ingredients.each do |ingredient|
  #       unique_ingredients << ingredient
  #     end
  #   end
  #   unique_ingredients = unique_ingredients.uniq

  # end
end

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

  def number_of(meal_id)
    list_meals = self.list_meals
    number_of_meals_in_list = 0
    list_meals.each do |lm|
      if lm.meal_id == meal_id
        number_of_meals_in_list += 1
      end
    end

    number_of_meals_in_list
  end

  def format_list
    list = compile_list
    formatted_list = []

    list.each do |ingred_id, quantity|
      ingredient = Ingredient.find(ingred_id)
      formatted_list.push("#{ingredient.name}: #{quantity} #{ingredient.unit_type}")
    end

    formatted_list
  end

  private 

    def compile_list
      list_hash = {}
      meal_items = self.meal_items

      meal_items.each do |meal_item|
        id = meal_item.ingredient_id.to_s
        qty = meal_item.quantity
        if (list_hash[id])
          list_hash[id] += qty
        else
          list_hash[id] = qty
        end
      end
      list_hash
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

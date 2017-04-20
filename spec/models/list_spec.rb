require 'rails_helper'

RSpec.describe List, type: :model do
  
  describe "contains_meal? method" do 
    let(:list) { List.create(name: "test", user_id: 1)}
    let(:meal) { Meal.create(name: "meal", user_id: 1)}
    let(:list_meal) { ListMeal.create(list_id: list.id, meal_id: meal.id )}

    it "returns true if a list already contains a meal" do
      expect(list.contains_meal?(meal)).to be true
    end
  end
end

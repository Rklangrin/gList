require 'rails_helper'

RSpec.describe List, type: :model do
  
  describe "contains_meal? method" do 
    before(:each) do 
      @user = User.create({email: "test", password: "123"})
      @list = List.create({name: "test", user_id: @user.id})
      @meal = Meal.create({name: "meal", user_id: @user.id})
      @meal_2 = Meal.create({name: "nope", user_id: @user.id})
      @list_meal = ListMeal.create({list_id: @list.id, meal_id: @meal.id })
    end

    it "returns false if a list doesn't contain a meal" do
      expect(@list.contains_meal?(@meal_2)).to be false
    end

    it "returns true if a list already contains a meal" do
      expect(@list.contains_meal?(@meal)).to eq true
    end
  end
end

class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end
end

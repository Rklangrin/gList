class MealsController < ApplicationController

  def index
    @meals = Meal.all
    
  end

  def new
    if !helpers.logged_in?
      redirect_to root_path
    end
    @meal = Meal.new
  end
end

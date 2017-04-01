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

  def create

    binding.pry
  end

  def new_ingredient
    respond_to do |format|
      format.js {}
      format.html { redirect_to :back }
    end 
  end
end

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
    @meal = Meal.new(meal_params)

    if @meal.save
      redirect_to new_meal_ingredient_path(@meal)
    else
      @errors = @meal.errors.full_messages
      render 'new'
    end
  end

  def show
    @meal = Meal.find_by(id: params[:id])
  end


  private

  def meal_params
    params.require(:meal).permit(:user_id, :name)
  end

  def ingredient_params(ingred_params)
    ingred_params.permit(:name, :unit_type)
  end

  def meal_item_params(meal_item_params)
    meal_item_params.permit(:quantity, :instruction, :meal_id)
  end
end

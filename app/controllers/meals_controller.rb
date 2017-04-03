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
    num_ingredients = params[:ingredient_quantity]
    @ingredients = []

    if @meal.save
      respond_to do |format|

        num_ingredients.times do 
          @ingredients << [Ingredient.new, MealItem.new]
        end

        # format.html {}
        format.js {}
      end
      
    else
      @errors = @meal.errors.full_messages
      render 'new'
    end
  end

  def new_ingredient
    
  end

  private

  def meal_params
    params.require(:meal).permit(:user_id, :name)
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient => [:name, :unit_type])
  end

  def meal_item_params
    params.require(:meal_item).permit(:meal_item => [:quantity, :instruction])
  end
end

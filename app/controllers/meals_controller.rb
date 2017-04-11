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
    num_ingredients = params[:ingredient_quantity].to_i
    @ingredients = []
    num_ingredients.times do 
      @ingredients << [Ingredient.new, MealItem.new]
    end

    if @meal.save
      respond_to do |format|
        format.js {}
      end
    else
      @errors = @meal.errors.full_messages
      respond_to do |format|
        format.js {}
      end
    end
  end

  def show
    @meal = Meal.find_by(id: params[:id])
  end

  def create_new_ingredients
    params[:ingredients].each_with_index do |nested_params, index|
      temp = Ingredient.create(ingredient_params(nested_params))
      temp.meal_items.create(meal_item_params(params[:meal_items][index]))
    end

    redirect_to meal_path(params[:meal_items][0][:meal_id])
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

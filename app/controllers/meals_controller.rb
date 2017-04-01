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
      ingredients_array = []
      # ingredient_params[:ingredient].each_with_index do |ingred_params, index|
      #   Ingredient.new(ingred_params)
      end
    else
      @errors = @meal.errors.full_messages
      render 'new'
    end
  end

  def new_ingredient
    respond_to do |format|
      format.js {}
      format.html { redirect_to :back }
    end 
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

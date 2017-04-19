class IngredientsController < ApplicationController

  def new
    @meal = Meal.find_by(id: params[:meal_id])
    @ingredient = Ingredient.new
    @meal_item = MealItem.new
  end

  def create
    @meal = Meal.find_by(id: params[:meal_id])
    @new_ingredient = Ingredient.new(ingredient_params)

    if @new_ingredient.save
      @new_meal_item = @new_ingredient.meal_items.new(meal_item_params)
      if @new_meal_item.save
        respond_to do |format|
          @ingredient = Ingredient.new
          @meal_item = MealItem.new
          format.html { render 'new' }
          format.js {}
        end
      else
        @errors = @meal_item.errors.full_messages
        render 'new'
      end
    else
      @errors = @ingredient.errors.full_messages
      render 'new'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit_type)
  end

  def meal_item_params
    params.require(:meal_item).permit(:meal_id, :quantity, :instruction)
  end
end

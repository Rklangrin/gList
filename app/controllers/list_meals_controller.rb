class ListMealsController < ApplicationController

  def create
    binding.pry
    @list_meal = ListMeal.new(list_meal_params)

    if @list_meal.save
      respond_to do |format|
        format.js {}
      end
    else
      @errors = @list_meal.errors.full_messages
      respond_to do |format|
        format.js {}
      end
    end
  end

  private

  def list_meal_params
    params.require(:list_meal).permit(:meal_id, :list_id)
  end
end

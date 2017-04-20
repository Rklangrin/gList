class ListMealsController < ApplicationController

  def create
    @list_meal = ListMeal.find_or_create_by(list_id: params[:list_id], meal_id: params[:id])
    binding.pry
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {}
    end
  end
end

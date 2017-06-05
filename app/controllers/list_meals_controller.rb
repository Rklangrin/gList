class ListMealsController < ApplicationController

  def create
    @list_meal = ListMeal.create(list_id: params[:list_id], meal_id: params[:id])
    list = List.where(id: params[:list_id]).includes(:list_meals)
    @list = list[0]

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {}
    end
  end
end

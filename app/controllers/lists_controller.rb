class ListsController < ApplicationController

  def new
    if !helpers.logged_in?
      redirect_to root_path
    end
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      @list_meal = ListMeal.new
      @meals = Meal.all
      respond_to do |format|
        format.js {}
      end
    else
      @errors = @list.errors.full_messages
      respond_to do |format|
        format.js {}
      end
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end

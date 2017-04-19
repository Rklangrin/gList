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
      redirect_to edit_list_path(@list)
    else
      @errors = @list.errors.full_messages
      render 'new'
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
    @meals = Meal.all
  end


  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end

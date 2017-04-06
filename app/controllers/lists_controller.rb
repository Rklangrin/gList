class ListsController < ApplicationController

  def new
    if !helpers.logged_in?
      redirect_to root_path
    end
    @list = List.new
  end
end

class HallsController < ApplicationController
  def index
  end

  def show
    @hall = Hall.find_by_id(params[:id])
    p @hall
    @script = @hall.get_graph
    @green_features = @hall.green_features
  end
end

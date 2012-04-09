class HallsController < ApplicationController
  def index
  end

  def show
    @hall = Hall.find_by_id(Integer(params[:id]))
    @interval = params[:interval]
    @path = @hall.get_graph(300, 260, @interval || "week")
    @green_features = @hall.green_features
  end
end

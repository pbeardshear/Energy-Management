class HallsController < ApplicationController
  layout 'mobile'

  def index
    @halls = Hall.all(:order => 'name')
  end

  def show
    @hall = Hall.find_by_id(Integer(params[:id]))
    @interval = params[:interval] || "week"
    @path = @hall.get_graph(300, 260, @interval)
    @data = @hall.get_data @interval
    @green_features = @hall.green_features
  end
end

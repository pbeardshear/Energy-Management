class EmbedsController < ApplicationController
  def index
    hall = Hall.find(params[:hall_id])
    @width = params[:width]
    @height = params[:height]
    @interval = params[:interval]
    @data = hall.get_data @interval

    respond_to do |format|
      format.js { render :layout => false }
    end
  end
end

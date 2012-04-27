class EmbedsController < ApplicationController
  def index
    hall = Hall.find(params[:hall_id])
    @width = params[:width]
    @height = params[:height]
    @interval = params[:interval]
    @data_url = hall.get_data_url

    # This will be removed in the near future
    @data = hall.get_data

    respond_to do |format|
      format.js { render :layout => false }
    end
  end
end

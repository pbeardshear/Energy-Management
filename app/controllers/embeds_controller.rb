class EmbedsController < ApplicationController
  def index
    @hall = params[:hall]
    @width = params[:width]
    @height = params[:height]
    @interval = params[:interval]
    respond_to do |format|
      format.js { render :layout => false }
    end
  end
end

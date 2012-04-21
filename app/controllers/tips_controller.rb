class TipsController < ApplicationController
  def index
    @tips = Tip.all
  end
  
  def show
    @tip = Tip.find_by_id params[:id]
    if !@tip
      # redirect to the index page
      flash[:error] = "That tip does not exist."
      redirect_to admin_tips_path
    end
  end
end

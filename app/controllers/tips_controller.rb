class TipsController < ApplicationController
  layout 'mobile'

  def index
    @categories = {}
    # Build up the possible categories
    Tip.all.each do |tip|
      tip.categories.each do |category|
        @categories[category.name] = [] unless @categories[category.name]
        @categories[category.name].push(tip)
      end
    end
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

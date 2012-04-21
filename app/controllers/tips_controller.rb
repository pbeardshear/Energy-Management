class TipsController < ApplicationController
  def index
    @tips = Tip.all
  end
  
  def show
    @category = Category.find_by_id(params[:id])
    if !@category
      flash[:error] = 'That category does not exist.'
      redirect_to categories_path
    else
      @category_tips = @category.tips
    end
  end
end

class TipsController < ApplicationController
  layout 'mobile'

  def index
    @categories = Tip.tips_by_categories
  end
end

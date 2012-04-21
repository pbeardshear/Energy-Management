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
end

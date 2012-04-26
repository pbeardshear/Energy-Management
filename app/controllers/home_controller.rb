class HomeController < ApplicationController
  layout 'mobile'
  
  def index
    @tip_of_the_day = Tip.tip_of_the_day
  end
end

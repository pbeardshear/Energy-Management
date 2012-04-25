class HomeController < ApplicationController
  layout 'mobile'
  
  def index
    all_tips = Tip.all
    general_tips = []
    # Compile the list of tips in the general category
    all_tips.each do |tip|
      tip.categories.each do |category|
        if category.name.downcase.include? "general"
          general_tips.push(tip)
          break
        end
      end
    end
    # Convert the date into an integer
    time = Time.new
    index = (time.month + time.day) % general_tips.length
    @tip_of_the_day = general_tips[index]
  end
end

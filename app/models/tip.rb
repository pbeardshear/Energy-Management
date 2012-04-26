class Tip < ActiveRecord::Base
  has_many :category_tips
  has_many :categories, :through => :category_tips
  validates_length_of :title, :minimum => 1, :too_short => "Please enter a title."
  validates_length_of :content, :minimum => 1, :too_short => "Please enter some content."

  def self.tips_by_categories
    @categories = {}
    # Build up the possible categories
    Tip.all.each do |tip|
      tip.categories.each do |category|
        @categories[category.name] = [] unless @categories[category.name]
        @categories[category.name].push(tip)
      end
    end
    @categories
  end

  def self.tip_of_the_day
    general_tips = self.tips_by_categories["General"]
    # Convert the date into an integer
    index = Time.now.yday % general_tips.length
    general_tips[index]
  end
end

class Tip < ActiveRecord::Base
  has_many :category_tips
  has_many :categories, :through => :category_tips
  validates_length_of :title, :minimum => 1, :too_short => "Please enter a title."
  validates_length_of :content, :minimum => 1, :too_short => "Please enter some content."
end

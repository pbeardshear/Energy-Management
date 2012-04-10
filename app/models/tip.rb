class Tip < ActiveRecord::Base
  has_many :categories, :through => :category_tips
end

class Tip < ActiveRecord::Base
  has_many :category_tips
  has_many :categories, :through => :category_tips
end

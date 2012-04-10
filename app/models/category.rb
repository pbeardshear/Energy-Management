class Category < ActiveRecord::Base
  has_many :tips, :through => :category_tips
  has_many :settings, :through => :device_categories
end

class Category < ActiveRecord::Base
  has_many :tips
  has_many :settings, :through => :device_categories
end

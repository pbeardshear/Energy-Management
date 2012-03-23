class Setting < ActiveRecord::Base
  has_many :halls, :through => :pinned_halls
  has_many :categories, :through => :device_categories

end

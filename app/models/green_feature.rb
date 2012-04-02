class GreenFeature < ActiveRecord::Base
  has_many :hall_features
  has_many :halls, :through => :hall_features
end

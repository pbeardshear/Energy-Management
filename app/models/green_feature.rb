class GreenFeature < ActiveRecord::Base
  has_many :halls, :through => :hall_features

end

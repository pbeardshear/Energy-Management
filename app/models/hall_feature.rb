class HallFeature < ActiveRecord::Base
  belongs_to :hall
  belongs_to :green_feature
end

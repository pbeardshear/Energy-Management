class Hall < ActiveRecord::Base
  has_many :features, :through => :hall_features
  has_many :settings, :through => :pinned_halls
  belongs_to :operational_unit
end

class Hall < ActiveRecord::Base
  has_many :hall_features
  has_many :green_features, :through => :hall_features
  has_many :settings, :through => :pinned_halls
  belongs_to :operational_unit
  
  def get_graph (width = 700, height = 300, interval = 'week')
    '<script src="http://my.pulseenergy.com/embed/?key=#{self.id}&width=#{width}&height=#{height}&interval=#{interval}"></script>'
  end
end


class Hall < ActiveRecord::Base
  has_many :hall_features
  has_many :green_features, :through => :hall_features
  has_many :settings, :through => :pinned_halls
  belongs_to :operational_unit
  
  def get_graph (width = 700, height = 300, interval = 'week')
    if self.key
      "http://my.pulseenergy.com/embed/?key=#{self.key}&width=#{width}&height=#{height}&interval=#{interval}"
    else
      host = "localhost:3000"
      "http://#{host}/embeds/?#{self.name}&width=#{width}&height=#{height}&interval=#{interval}"
    end
  end
end


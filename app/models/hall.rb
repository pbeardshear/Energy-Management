require 'net/http'

class Hall < ActiveRecord::Base
  has_many :hall_features
  has_many :green_features, :through => :hall_features
  has_many :settings, :through => :pinned_halls
  belongs_to :operational_unit
  
  def get_graph (width = 700, height = 300, interval = 'week')
    if self.key
      "http://my.pulseenergy.com/embed/?key=#{self.key}&width=#{width}&height=#{height}&interval=#{interval}"
    else
      # hard-coded, need to find a way to dynamically know this 
      # application's url, so it works no matter where we host it.
      host = "localhost:3000"
      "http://#{host}/embeds/?hall_id=#{self.id}&width=#{width}&height=#{height}&interval=#{interval}"
    end
  end

  def get_data
    # gets graph data of the given hall
    params = { "Metadata/Instrument/Manufacturer" => "UC Berkeley",
                "Metadata/Location/Building" => self.name }
    base = "http://new.openbms.org/backend/api/prev/"
    path = Hall.construct_path(params)
    Net::HTTP.get(URI(base + path))
  end

  def self.construct_path params
    result = params.map do |key, value|
      key.gsub('/','__') + '/' + value.gsub(' ','%20')  
    end
    result.join('/')
  end
end


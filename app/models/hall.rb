require 'net/http'

class Time
  def to_ms
    (self.to_f * 1000.0).to_i
  end
end

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

  def get_data interval
    # This will become deprecated, once we move the
    # ajax call to client side    
    
    params = { 
      :starttime => Time.now.to_ms,
      :endtime => getendtime(interval),
      :limit => 1000,
      :streamlimit => 100 }
    
    url = get_data_url params
    uri = URI(url)
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get(uri)

  end

  def get_data_url params
    base = "http://new.openbms.org/backend/api/prev"
    name = self.name.gsub(' ', '%20')
    ret = "#{base}/Metadata__Location__Building/#{name}/Properties__UnitofMeasure/kW?"
    
    things = params.map { |key, value| 
      "#{key}=#{value}"  
    }
    
    ret += things.join("&")
  end

  def getendtime interval
    if interval == "day"
      1.day.ago.to_ms
    elsif interval == "week"
      1.week.ago.to_ms
    elsif interval == "month"
      1.month.ago.to_ms
    end
  end

  def self.getquery starttime endtime hall
    "apply nansum(axis=1) < paste < window(first, field='minute', increment=15) < units to  data in (#{starttime}, #{endtime}) streamlimit 10000 where Metadata/Extra/System = 'electric'  and ((Properties/UnitofMeasure = 'kW' or Properties/UnitofMeasure = 'Watts') or Properties/UnitofMeasure = 'W') and Metadata/Location/Building like '#{hall}%' and not Metadata/Extra/Operator like 'sum%' and not Path like '%demand'";
  end
end

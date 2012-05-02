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
    starttime = getendtime(interval)
    endtime = Time.now.to_ms

    uri = URI.parse("http://new.openbms.org/backend/api/query")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = Hall.getquery(starttime, endtime, self.name)

    resp = http.request(request)
    resp.body
  end

  def self.getquery(starttime, endtime, hallname)
    streamlimit = 1000
    "select data in (#{starttime}, #{endtime}) streamlimit #{streamlimit} where Metadata/Extra/System = 'electric'  and ((Properties/UnitofMeasure = 'kW' or Properties/UnitofMeasure = 'Watts') or Properties/UnitofMeasure = 'W') and Metadata/Location/Building = '#{hallname}' and not Metadata/Extra/Operator like 'sum%'"
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

end

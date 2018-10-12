require "open-uri"
require "date"
require "active_support/time"

namespace :smog do
  
  desc "Get current measurements from installation"
  task get_data: :environment do
  	sensors_ids = Installation.all.map { |n| n.sensor_id }

  	sensors_ids.each do |id| 
	    responce = RestClient::Request.execute(
	      :method => :get,
	      :url => "https://airapi.airly.eu/v2/measurements/installation?installationId=#{id}",
	      :headers => {'apikey' => ''}
	    )
	    data = JSON.parse(responce)
	    # TODO: better parse date from JSON 
	    Measurement.create(pm1: data["current"]["values"][0]["value"].to_i, pm25: data["current"]["values"][0]["value"].to_i, pm10: data["current"]["values"][0]["value"].to_i, measured_at: Time.now, station_id: Installation.find_by(sensor_id: id).id) unless data["current"].blank?
	  end
  end

end

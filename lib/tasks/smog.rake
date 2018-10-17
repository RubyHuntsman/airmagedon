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
	      :headers => {'apikey' => Setting.api_key}
	    )
	    data = JSON.parse(responce)
		
			Measurement.create(pm1: data["current"]["values"][0]["value"].to_i, 
	    								   pm25: data["current"]["values"][1]["value"].to_i, 
	    								   pm10: data["current"]["values"][2]["value"].to_i, 
	    								   measured_at: Time.now, 
	    								   installation_id: Installation.find_by(sensor_id: id).id
	    				  				 ) unless data["current"].blank?

		end
  
  end
		# UserMailer.notif("wlodku@gmail.com").deliver

end

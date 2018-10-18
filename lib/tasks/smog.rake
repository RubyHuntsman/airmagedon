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
	      :url => "https://airapi.airly.eu/v1/sensor/measurements/?sensorId=#{id}",
	      :headers => {'apikey' => Setting.api_key }
	    )
	    data = JSON.parse(responce)
	    next if data["currentMeasurements"].blank?
	    Measurement.create(pm1: data["currentMeasurements"]["pm1"].to_i, 
	    									 pm25: data["currentMeasurements"]["pm25"].to_i, 
	    									 pm10: data["currentMeasurements"]["pm10"].to_i, 
	    									 measured_at: Time.now, 
	    									 installation_id: Installation.find_by(sensor_id: id).id) unless data["currentMeasurements"].blank?



	  #   responce = RestClient::Request.execute(
	  #     :method => :get,
	  #     :url => "https://airapi.airly.eu/v2/measurements/installation?installationId=#{id}",
	  #     :headers => {'apikey' => Setting.api_key}
	  #   )
	  #   data = JSON.parse(responce)
		
			# Measurement.create(pm1: data["current"]["values"][0]["value"].to_i, 
	  #   								   pm25: data["current"]["values"][1]["value"].to_i, 
	  #   								   pm10: data["current"]["values"][2]["value"].to_i, 
	  #   								   measured_at: Time.now, 
	  #   								   installation_id: Installation.find_by(sensor_id: id).id
	  #   				  				 ) unless data["current"].blank?

		end  
		send_emails if Setting.notif_on
  end
  
	
  def send_emails
  	users_to_warn = User.activated.not_spammed
  	live = []
    Measurement.last(2000).group_by{ |s| s.installation_id }.each do |s, m|
      live.push(m.last) if m.last.created_at > 3.hours.ago
    end
    
  	users_to_warn.each	do |u|
			over_critical_measurements = live.select { |m| m.qi <= u.critical }
    	followed_by_user = u.subscriptions.map { |s| s.installation_id }
    	measurements = over_critical_measurements.select { |m| followed_by_user.include?(m.installation_id)}
    	if measurements.count > 0
    		u.update_attribute(:email_sent_at, Time.now) if UserMailer.notif(u, measurements).deliver
    	end
  	end
	end


end	
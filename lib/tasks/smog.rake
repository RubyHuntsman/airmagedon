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

  desc "Send mails"
  task send_mails: :environment do
  	users_to_check = User.activated.not_spammed


	# users_to_check = User.where(["isactive = :isactive and email_sent_at < email_sent_at:", { isactive: true, email_sent_at: Time.now - 12.hours})
	
	#  # User.where(["isactive = ? and email_sent_at = ?", true, Time.now - 8.hours])

	# users_to_check.each do |u|
	# 	user_installations_ids = Subscription.where(user_id == u.id)
	# 	# get all measurements last where id = installation_id
	# 	overhight_measurements = user_installations_ids.map { |i| Measurement.where(installation_id = i).last }  #chyba nie where bo znajdzie wszystkie  tylko find bo znajdzie ostatni, ajeżeni nie to można dać ".last"
	# 	# user_installations_ids = Subscription.all.map { |s| s.} // nie jest dobre # wydajnosc
	
	# 	if overhight_measurements 
	# 		UserMailer.notif("wlodku@gmail.com", overhight_measurements).deliver
	# 	end
	end

	desc "spam machine"
  task qwe: :environment do
  	users_to_warn = User.activated.not_spammed

  	users_to_warn.each	do |u|
			if UserMailer.notif(u).deliver
				u.email_sent_at = Time.now
				u.save
			end
  	end
		# puts "Wyslalem maila"
	end


  #User.all.where("isactive = true")
  #Measurement.all

# where('email_sent_at > :last_hours', 
	# 											 	 :last_hours => Time.now - 12.hours)




# Teraz wez wszytkie pomiary które zaznaczyl uzytkownik
# i sprawdzaj czy ktorys ma wyzsze PM niz twoj uzytkownik
#

  		# UserMailer.notif("wlodku@gmail.com").deliver
end

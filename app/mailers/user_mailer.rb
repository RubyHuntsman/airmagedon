class UserMailer < ApplicationMailer
	default from: 'maciej.lokio@interia.pl'
  layout 'mailer'

  def notif(address)
  	@last_measurement = Measurement.last
  	mail(headers = {to: address, reply_to: 'noreply@airmagedon.pl', subject: 'Uwaga!'})

  end

  
end

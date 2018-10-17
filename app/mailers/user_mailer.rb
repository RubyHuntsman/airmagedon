class UserMailer < ApplicationMailer
	default from: 'maciej.lokio@interia.pl'
  layout 'mailer'

  def notif(address)
  	@last_measurement = Measurement.last

		delivery_options = {
                         user_name: Setting.smtp_login,
                         password: Setting.smtp_password,
                         address: Setting.smtp_host
                       }

		mail(to: address,
         subject: "Uwaga na smog",
         delivery_method_options: delivery_options)
  end

end

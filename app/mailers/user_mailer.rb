class UserMailer < ApplicationMailer
	default from: 'maciej.lokio@interia.pl'
  layout 'mailer'

  def notif(user)
		delivery_options = {
                         user_name: Setting.smtp_login,
                         password: Setting.smtp_password,
                         address: Setting.smtp_host
                       }

    live = []
    Measurement.last(2000).group_by{ |s| s.installation_id }.each do |s, m|
      live.push(m.last) if m.last.created_at > 3.hours.ago
    end
    @om = live.map { |m| m.qi <= user.critical }
		mail(to: address,
         subject: "Uwaga na smog",
         delivery_method_options: delivery_options)
  end

end

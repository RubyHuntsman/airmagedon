class ApplicationController < ActionController::Base
	layout :check_if_signed

	def check_if_signed
		user_signed_in? ? 'application':'dashboard'
	end
end

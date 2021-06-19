class ApplicationController < ActionController::Base

	before_action :authenticate_user!

	before_action :configure_permitted_params, if: :devise_controller?
	# layout :layout

	protected

	def configure_permitted_params
		devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
	end

	#
	# def layout
	#   # only turn it off for login pages:
	#   is_a?(Devise::SessionsController) ? false : "application"
	# end

end

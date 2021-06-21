class ApplicationController < ActionController::Base

	before_action :authenticate_user!

	before_action :remove_authentication_flash_message_if_root_url_requested

	before_action :configure_permitted_params, if: :devise_controller?
	# layout :layout

	protected

	def configure_permitted_params
		devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
	end

	# Костыль что бы скрывать флеш алерт
  def remove_authentication_flash_message_if_root_url_requested
    if session[:user_return_to] == root_path and flash[:alert] == I18n.t('devise.failure.unauthenticated')
      flash[:alert] = nil
    end
  end
	#
	# def layout
	#   # only turn it off for login pages:
	#   is_a?(Devise::SessionsController) ? false : "application"
	# end

end

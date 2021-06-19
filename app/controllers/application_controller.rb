class ApplicationController < ActionController::Base

	before_action :authenticate_user!

  # layout :layout

  private
	#
  # def layout
  #   # only turn it off for login pages:
  #   is_a?(Devise::SessionsController) ? false : "application"
  # end

end

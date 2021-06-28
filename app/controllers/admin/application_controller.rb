class Admin::ApplicationController < ActionController::Base

	before_action :authenticate_user!


  def layout
    # only turn it off for login pages:
  end
end

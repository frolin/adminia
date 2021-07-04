class NotificationsController < ApplicationController
	def index
		render locals: { notifications: current_user.notifications }
	end
end

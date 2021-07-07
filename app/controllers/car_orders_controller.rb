class CarOrdersController < ApplicationController

	def index
		render locals: { resources: collection }
	end



	private

	def collection
		@collection ||= current_user.car_orders
	end

	def resource
		@resource ||= resource_class.find(params[:id])
	end

end

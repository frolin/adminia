class NeighborsController < ApplicationController
	def show
		render locals: { user: resource }
	end

	def index
		render locals: { neighbors: resources }
	end

	def resource_class
		@resource_class ||= User
	end

	def resources
		@resource ||= resource_class.all
	end

	def resource
		@resource ||= resource_class.find(params[:id])
	end

end

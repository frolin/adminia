class ProjectsController < ApplicationController
	def show
	end

	def index
		render locals: { projects: resource }
	end

	def resource
		@resource ||= Project.all
	end
end

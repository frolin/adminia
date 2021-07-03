class IssuesController < ApplicationController
	def new
		render locals: { issue: resource_class.new }
	end

	def edit
		render locals: { issue: resource }
	end

	def create
		issue = Issue.new(permitted_params)
		issue.user_id = current_user.id
		authorize issue

		if issue.save
			redirect_to issue_path(issue), notice: 'Post was successfully created.'
		else
			render :new, locals: { issue: issue }
		end
	end

	def show
		authorize resource
		render locals: { issue: resource }
	end

	def index
		authorize resources
		render locals: { issues: resources }
	end

	private

	def permitted_params
		params.require(:issue).permit(:id, :name, :description, :user_id, tag_list: [], images: [])
	end

	def resource_class
		@resource_class ||= Issue
	end

	def resources
		@resource ||= resource_class.all
	end

	def resource
		@resource ||= resource_class.find(params[:id])
	end

end

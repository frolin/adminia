class IssuesController < ApplicationController

	def new
	   @issue = resource_class.new
	end

	def create
    issue = Issue.new(issue_params)

    if issue.save
      redirect_to issue_path(issue), notice: 'Post was successfully created.'
    else
	   @issue = resource_class.new

      render :new
    end
	end


	def show
		render locals: { issue: resource }
	end

	def index
		render locals: { issues: resources }
	end

	private

	def issue_params
		params.require(:issue).permit(:id, :name, :description, images:[] )
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

class IssuesController < ApplicationController

	def index
		collection = resources
		collection = collection.filter_by_status(params[:status]) if params[:status].present?

		authorize collection

		render locals: { issues: collection}
	end

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
			IssueNotification.with(issue: issue).deliver_later(User.with_notify_settings)
		else
			render :new, locals: { issue: issue }
		end
	end

	def show
		authorize resource
		render locals: { issue: resource }
	end


	def delete_image_attachment
		image_id = params.dig(:image, :id)
		attachment = ActiveStorage::Attachment.find(image_id)

		if attachment.present?
			attachment.purge_later

			flash[:success] = "Изображение успешно удалено"
			redirect_to edit_issue_path(resource), flash: { notice: "Изображение успешно удалено" }
		else
			flash[:notice] = "Не удалось найти данное изображение"
			raise 'not found!'
			redirect_to edit_issue_path(resource), flash: { alert: "Не удалось найти данное изображение" }
		end
	end

	private

	def permitted_params
		params.require(:issue).permit(:id, :name, :description, :user_id, :category, images: [], tag_list: [])
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

# To deliver this notification:
#
# IssueNotification.with(post: @post).deliver_later(current_user)
# IssueNotification.with(post: @post).deliver(current_user)

class IssueNotification < Noticed::Base
	# Add your delivery methods
	#
	deliver_by :database
	# deliver_by :email, mailer: "UserMailer"
	# deliver_by :slack
	# deliver_by :custom, class: "MyDeliveryMethod"

	# Add required params
	#
	param :issue

	def to_database
		{
			type: self.class.name,
			params: params,
			account: Current.account
		}
	end

	# Define helper methods to make rendering easier.
	#
	def message
	  t(".message", issue: params[:issue].attributes['name'])
	end

	def url
		issue_path(params[:issue])
	end
end

module ApplicationHelper
	def is_active_controller(controller_name, class_name = nil)
		if params[:controller] == controller_name
			class_name == nil ? "active" : class_name
		else
			nil
		end
	end

	def is_active_action(action_name)
		params[:action] == action_name ? "active" : nil
	end

	# def resource_name(resource)
	#
	# 	'Issue'.constantize.name
	# 	if resource.class.respond_to?(:model_name)
	# 		resource.class.model_name.human
	# 	else
	# 		resource.class.name.underscore.humanize
	# 	end
	# end

	def menu_issue_counter
		content_tag :span, :class => "label label-warning  float-right" do
			"#{Issue.created.size}/#{Issue.done.size}"
		end
	end

end

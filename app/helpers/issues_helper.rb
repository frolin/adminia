module IssuesHelper
	def label_status(status, type)
		color = case status.to_sym
		        when :queue
			        'warning'
		        when :in_work
			        'primary'
		        when :done
			        'success'
		        when :archive
			        ''
		        end

		content_tag :div, :class => "#{type} #{type}-#{color}" do
			I18n.t(".issue.status.#{status}")
		end
	end

end

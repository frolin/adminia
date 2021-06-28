module IssueStateMachine
	def self.included(base)
		base.class_eval do
			include AASM
			# include StateMachineMethods

			# has_many :transitions,
			#          class_name: '::Vpct::ProgramVersionStateTransition', as: :statable, dependent: :destroy

			aasm column: :status, requires_lock: true do

				state :queue, initial: true

				state :in_work, :done, :archive

				# after_all_transitions :create_snapshot, :create_state_transition

				# В работе
				event :accept_work do
					transitions from: :queue, to: :in_work
				end
				event :issue_done do
					transitions from: :in_work, to: :done
				end
				event :archived do
					transitions from: :done, to: :archive
				end


			end
		end
	end
end

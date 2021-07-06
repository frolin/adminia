class Issue < ApplicationRecord
	include IssueStateMachine
	belongs_to :user
	belongs_to :category, required: false

	acts_as_taggable_on :tags

	scope :by_status, -> { order(status: :desc) }

	scope :created, -> { where(status: [:queue, :in_work]) }
	scope :done, -> { where(status: :done) }

	has_many_attached :images do |attachable|
		attachable.variant :thumb, resize: "100x100"
		attachable.variant :cover, resize: "400x160"
	end
	validates :name, :description, presence: true

	def self.statuses
		 Issue.aasm.states.map(&:name)
	end

end

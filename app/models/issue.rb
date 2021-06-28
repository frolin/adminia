class Issue < ApplicationRecord
	include IssueStateMachine
	belongs_to :user

	acts_as_taggable_on :tags
	scope :by_status, ->  { order(status: :desc) }

	scope :created, ->  { where(status: [:queue, :in_work]) }
	scope :done, ->  { where(status: :done) }

	has_many_attached :images do |attachable|
		attachable.variant :thumb, resize: "320x230"
	end

end
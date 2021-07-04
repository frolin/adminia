class Issue < ApplicationRecord
	include IssueStateMachine
	belongs_to :user
	belongs_to :category, required: false

	acts_as_taggable_on :tags

	scope :by_status, ->  { order(status: :desc) }

	scope :created, ->  { where(status: [:queue, :in_work]) }
	scope :done, ->  { where(status: :done) }

	has_many_attached :images

	validates :name, :description, presence: true

end

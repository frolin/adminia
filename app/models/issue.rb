# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  date        :datetime
#  description :text
#  name        :string
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer          not null
#
# Indexes
#
#  index_issues_on_category_id  (category_id)
#  index_issues_on_user_id      (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Issue < ApplicationRecord
	include IssueStateMachine

	belongs_to :user
	belongs_to :category, required: false


	has_many :comments, as: :commentable

	acts_as_taggable_on :tags

	scope :by_status, -> { order(status: :desc) }

	scope :created, -> { where(status: [:queue, :in_work]) }
	scope :done, -> { where(status: :done) }

	scope :filter_by_status, -> (status) { where status: status }

	has_many_attached :images do |attachable|
		attachable.variant :thumb, resize: "100x100"
		attachable.variant :cover, resize: "400x160"
	end
	validates :name, :description, presence: true

	def self.statuses
		 Issue.aasm.states.map(&:name)
	end

end

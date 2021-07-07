# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  locality               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  second_name            :string
#  settings               :json
#  third_name             :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_invitation_token      (invitation_token) UNIQUE
#  index_users_on_invited_by            (invited_by_type,invited_by_id)
#  index_users_on_invited_by_id         (invited_by_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :invitable, :database_authenticatable, :recoverable, :rememberable, :validatable

	store_accessor :settings, :new_issue_notification

	has_one_attached :avatar do |attachable|
		attachable.variant :thumb, resize: "128x128"
	end

	has_many :issues
	has_many :projects
	has_many :users_roles
	has_many :roles, through: :users_roles
	has_many :car_orders

	### noticed gem
		has_many :notifications, as: :recipient
	###

	scope :neighbors, -> { where(admin: false) }
	scope :with_notify_settings, -> { where(new_issue_notification: true)}


	def username
		"#{second_name} #{first_name} #{third_name}"
	end

	def with_role?(role_name)
		self.roles.map(&:name).include?(role_name)
	end

	def user_avatar(size = 40)
		if self.avatar.attached?
			self.avatar.variant(resize: "#{size}x#{size}!")
		else
			'https://randomuser.me/api/portraits/women/50.jpg'
		end
	end

	def full_name
		"#{second_name} #{second_name} #{third_name}"
	end
end

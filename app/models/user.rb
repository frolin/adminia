class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable

	has_one_attached :avatar do |attachable|
		attachable.variant :thumb, resize: "128x128"
	end

	has_many :issues
	has_many :projects

	scope :neighbors, -> { where(admin: false) }

	def username
		"#{second_name} #{first_name} #{third_name}"
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

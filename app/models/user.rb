class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable

	has_one_attached :avatar

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
end

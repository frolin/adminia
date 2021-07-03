class Category < ApplicationRecord
	has_many :issues
	validates :name, presence: true, uniqueness: true


end

class Role < ApplicationRecord
  # enum [:super_admin, :admin, :common, :interested]
  has_many :users_roles
  has_many :user, through: :users_roles

  validates :name, presence: true, uniqueness: true
end

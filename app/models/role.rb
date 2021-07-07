# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  alias       :string
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Role < ApplicationRecord
  # enum [:super_admin, :admin, :common, :interested]
  has_many :users_roles
  has_many :user, through: :users_roles

  validates :name, presence: true, uniqueness: true
end

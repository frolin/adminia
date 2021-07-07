# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  date        :datetime
#  description :text
#  goal_price  :decimal(8, 2)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
  belongs_to :user

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize: "320x230"
  end
end

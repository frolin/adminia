# == Schema Information
#
# Table name: car_orders
#
#  id         :integer          not null, primary key
#  active     :boolean
#  number     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_car_orders_on_user_id  (user_id)
#
class CarOrder < ApplicationRecord
	belongs_to :user
end

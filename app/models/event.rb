# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  body       :text
#  date       :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Event < ApplicationRecord
end

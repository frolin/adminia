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
require "test_helper"

class IssueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

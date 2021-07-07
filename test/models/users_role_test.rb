# == Schema Information
#
# Table name: users_roles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_users_roles_on_role_id  (role_id)
#  index_users_roles_on_user_id  (user_id)
#
# Foreign Keys
#
#  role_id  (role_id => roles.id)
#  user_id  (user_id => users.id)
#
require "test_helper"

class UsersRoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: user_roles
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#  role_id     :integer
#  user_id     :integer
#

require 'test_helper'

class UserRoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

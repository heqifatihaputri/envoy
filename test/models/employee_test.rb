# == Schema Information
#
# Table name: employees
#
#  id              :bigint(8)        not null, primary key
#  assistant_email :string
#  delete_at       :datetime
#  email           :string
#  full_name       :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  location_id     :integer
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

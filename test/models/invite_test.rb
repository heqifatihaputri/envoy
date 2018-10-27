# == Schema Information
#
# Table name: invites
#
#  id            :bigint(8)        not null, primary key
#  arrival       :datetime
#  email_visitor :string
#  full_name     :string
#  host          :string
#  private_notes :text
#  sign_in_time  :datetime
#  signed_in     :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location_id   :integer
#

require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

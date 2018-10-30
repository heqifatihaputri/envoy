# == Schema Information
#
# Table name: visitors
#
#  id                 :bigint(8)        not null, primary key
#  photo_url          :string
#  private_notes      :text
#  purpose_of_visit   :text
#  sign_in_time       :datetime
#  sign_out_time      :datetime
#  signed_in          :boolean          default(FALSE)
#  signed_out         :boolean          default(FALSE)
#  your_email_address :string
#  your_full_name     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  location_id        :integer
#  user_id            :integer
#

require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

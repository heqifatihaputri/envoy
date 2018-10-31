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

class Employee < ApplicationRecord
  belongs_to :location

  after_create :invite_user

  def invite_user
    User.invite!(full_name: full_name, email: email, phone_number: phone_number, assistant_email: assistant_email)
  end
end

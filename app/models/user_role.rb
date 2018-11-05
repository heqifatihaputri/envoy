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

class UserRole < ApplicationRecord
  belongs_to :role
  belongs_to :location
  belongs_to :user
end

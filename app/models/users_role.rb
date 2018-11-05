# == Schema Information
#
# Table name: users_roles
#
#  location_id :integer
#  role_id     :integer
#  user_id     :integer
#
# Indexes
#
#  index_users_roles_on_role_id              (role_id)
#  index_users_roles_on_user_id              (user_id)
#  index_users_roles_on_user_id_and_role_id  (user_id,role_id)
#

class UsersRole < ActiveRecord::Base

  # belongs_to :role
  # belongs_to :location
  # belongs_to :user

end

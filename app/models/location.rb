# == Schema Information
#
# Table name: locations
#
#  id            :bigint(8)        not null, primary key
#  address       :string
#  company_name  :string
#  location_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Location < ApplicationRecord
  attr_accessor :current 

  has_many :users_roles
  has_many :users, through: :users_roles
  has_many :roles, through: :users_roles

  has_many :visitors
  has_many :invites
  has_many :employees

  # after_create :init_user_role

  # attr_accessor :current_role, :current_user

  # attr_accessor :user_id, :role_id, :location_id

  # def init_user_role
  #   UserRole.create!(user_id: current_user, role_id: current_role, location_id: id)
  # end
end

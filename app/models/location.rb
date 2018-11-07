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
#  user_id       :integer
#

class Location < ApplicationRecord
  attr_accessor :current 

  has_many :users_roles
  has_many :users, through: :users_roles
  has_many :roles, through: :users_roles

  belongs_to :user

  has_many :visitors
  has_many :invites
  has_many :employees

  # attr_accessor :current_role, :current_user

  # after_create :init_user_role

  # attr_accessor :user_id, :role_id, :location_id

  # def init_user_role
  #   UsersRole.create!(user_id: user.id, role_id: 9, location_id: id)
  # end
end

class Location < ApplicationRecord
  attr_accessor :current 

  has_many :users_roles
  has_many :users, through: :users_roles
  has_many :roles, through: :users_roles
end

class UsersRole < ActiveRecord::Base

  attr_accessor :role_id, :user_id, :location_id

  belongs_to :role
  belongs_to :location
  belongs_to :user

end
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: :true
  validates :full_name, uniqueness: :true
  validates_uniqueness_of :email

  attr_accessor :current_role 

  has_many :users_roles
  has_many :roles, through: :users_roles
  has_many :locations, through: :users_roles

  after_create :init_user_profile

  attr_accessor :address, :company_name, :location_name, :user_id, :role_id, :location_id

  def init_user_profile
    location = Location.create(company_name: company_name, location_name: "HQ", address: address)
    UsersRole.create!(user_id: id, role_id: 9, location_id: location.id)
    UsersRole.create!(user_id: id, role_id: 10, location_id: location.id)
    UsersRole.create!(user_id: id, role_id: 14, location_id: location.id)
  end
end

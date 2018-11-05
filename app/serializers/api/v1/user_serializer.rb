class Api::V1::UserSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes(*User.attribute_names.map(&:to_sym))

  # validates :full_name, presence: :true
  # validates :full_name, uniqueness: :true
  # validates_uniqueness_of :email

  # attr_accessor :current_role 

  # has_many :user_roles
  # has_many :roles, through: :user_roles
  # has_many :locations, through: :user_roles

  # has_many :invites
  # has_many :visitors

  # after_create :init_user_profile

  # attr_accessor :address, :company_name, :location_name, :user_id, :role_id, :location_id

  # private

  # def init_user_profile
  #   unless self.invited_to_sign_up?
  #     location = Location.create(company_name: company_name, location_name: "HQ", address: address)
  #     UsersRole.create!(user_id: id, role_id: 9, location_id: location.id)
  #     UsersRole.create!(user_id: id, role_id: 10, location_id: location.id)
  #     UsersRole.create!(user_id: id, role_id: 14, location_id: location.id)
  #   end
  # end

  # before_validation :ensure_token

  # def ensure_token
  #   self.token = generate_hex(:token) unless token.present?
  # end

  # def generate_hex(column)
  #   loop do
  #     hex = SecureRandom.hex
  #     break hex unless self.class.where(column => hex).any?
  #   end
  # end
end
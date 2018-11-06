class Api::V1::LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes(*Location.attribute_names.map(&:to_sym))

  has_many :users_roles
  has_many :users, through: :users_roles
  has_many :roles, through: :users_roles

  has_many :visitors
  has_many :invites
  has_many :employees
end
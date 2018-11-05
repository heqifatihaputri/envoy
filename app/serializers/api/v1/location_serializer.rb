class Api::V1::LocationSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes(*Location.attribute_names.map(&:to_sym))

  has_many :user_roles
  has_many :users, through: :user_roles
  has_many :roles, through: :user_roles

  has_many :visitors
  has_many :invites
  has_many :employees
end
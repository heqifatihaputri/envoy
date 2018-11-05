class Api::V1::RoleSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes(*Role.attribute_names.map(&:to_sym))

  has_many :user_roles
  has_many :users
  has_many :locations
end
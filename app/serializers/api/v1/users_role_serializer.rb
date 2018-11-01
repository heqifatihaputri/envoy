class Api::V1::UsersRoleSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes(*UsesrRole.attribute_names.map(&:to_sym))

  belongs_to :role
  belongs_to :location
  belongs_to :user

end
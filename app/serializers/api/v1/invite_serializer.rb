class Api::V1::InviteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :arrival, :email_visitor, :full_name, :private_notes, :location_id, :user_id

  belongs_to :location
  belongs_to :user
end
class Api::V1::InviteSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes(*Invite.attribute_names.map(&:to_sym))

  validates :arrival, :email_visitor, :full_name, :user_id, presence: true

  belongs_to :location
  belongs_to :user

  def sign_in
     self.signed_in = true
     self.sign_in_time = Time.now
     self.save!
  end
end
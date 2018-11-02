class Api::V1::EmployeeSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes(*Employee.attribute_names.map(&:to_sym))

  belongs_to :location

  after_create :invite_user

  def invite_user
    user = User.invite!(full_name: full_name, email: email, phone_number: phone_number, assistant_email: assistant_email)
    UsersRole.create!(user_id: user.id, role_id: 14, location_id: location_id)
  end
end
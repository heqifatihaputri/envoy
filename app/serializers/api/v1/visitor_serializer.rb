class Api::V1::VisitorSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes(*Visitor.attribute_names.map(&:to_sym))

  # mount_uploader :photo_url, PhotoUrlUploader

  # validates :purpose_of_visit, :your_email_address, :your_full_name, :user_id, presence: true

  belongs_to :location
  belongs_to :user
  # self.per_page = 50

  def sign_out
    self.signed_out = true
    self.sign_out_time = Time.now
    self.save!
  end
end
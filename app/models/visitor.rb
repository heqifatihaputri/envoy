# == Schema Information
#
# Table name: visitors
#
#  id                 :bigint(8)        not null, primary key
#  photo_url          :string
#  private_notes      :text
#  purpose_of_visit   :text
#  sign_in_time       :datetime
#  sign_out_time      :datetime
#  signed_in          :boolean          default(FALSE)
#  signed_out         :boolean          default(FALSE)
#  your_email_address :string
#  your_full_name     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  location_id        :integer
#  user_id            :integer
#

class Visitor < ApplicationRecord
  mount_uploader :photo_url, PhotoUrlUploader

  validates :purpose_of_visit, :your_email_address, :your_full_name, :user_id, presence: true

  belongs_to :location
  belongs_to :user

  include PgSearch
  pg_search_scope :search_by_full_name, against: [:your_full_name],
    using: {
      tsearch: {
        prefix: true
      }
    }

  pg_search_scope :search_by_date, against: [:created_at]

  def sign_out
    self.signed_out = true
    self.sign_out_time = Time.now
    self.save!
  end
end

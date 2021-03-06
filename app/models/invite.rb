# == Schema Information
#
# Table name: invites
#
#  id            :bigint(8)        not null, primary key
#  arrival       :datetime
#  email_visitor :string
#  full_name     :string
#  private_notes :text
#  sign_in_time  :datetime
#  signed_in     :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location_id   :integer
#  user_id       :integer
#

class Invite < ApplicationRecord
  validates :arrival, :email_visitor, :full_name, :user_id, presence: true

  belongs_to :location
  belongs_to :user

  include PgSearch
  pg_search_scope :search_by_full_name, against: [:full_name],
    using: {
      tsearch: {
        prefix: true
      }
    }

  pg_search_scope :search_by_date, against: [:arrival]

  def sign_in
     self.signed_in = true
     self.sign_in_time = Time.now
     self.save!
  end
end

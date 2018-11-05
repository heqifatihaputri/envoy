# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  assistant_email        :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  full_name              :string
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  locked_at              :datetime
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :bigint(8)
#
# Indexes
#
#  index_users_on_confirmation_token                 (confirmation_token) UNIQUE
#  index_users_on_email                              (email) UNIQUE
#  index_users_on_invitation_token                   (invitation_token) UNIQUE
#  index_users_on_invitations_count                  (invitations_count)
#  index_users_on_invited_by_id                      (invited_by_id)
#  index_users_on_invited_by_type_and_invited_by_id  (invited_by_type,invited_by_id)
#  index_users_on_reset_password_token               (reset_password_token) UNIQUE
#  index_users_on_unlock_token                       (unlock_token) UNIQUE
#

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, timeout_in: 30.minutes

  validates :full_name, presence: :true
  validates :full_name, uniqueness: :true
  validates_uniqueness_of :email

  attr_accessor :current_role 

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :locations, through: :user_roles

  has_many :invites
  has_many :visitors

  after_create :init_user_profile

  attr_accessor :address, :company_name, :location_name, :user_id, :role_id, :location_id

  private

  def init_user_profile
    unless self.invited_to_sign_up?
      location = Location.create(company_name: company_name, location_name: "HQ", address: address)
      UserRole.create!(user_id: id, role_id: 9, location_id: location.id)
      UserRole.create!(user_id: id, role_id: 10, location_id: location.id)
      UserRole.create!(user_id: id, role_id: 14, location_id: location.id)
    end
  end

end

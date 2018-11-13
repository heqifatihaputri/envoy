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
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, timeout_in: 30.minutes

  validates :full_name, presence: :true
  validates :full_name, uniqueness: :true
  validates_uniqueness_of :email

  attr_accessor :current_role 

  has_many :users_roles
  has_many :roles, through: :users_roles
  has_many :locations, through: :users_roles

  has_many :invites
  has_many :visitors

  validates_presence_of :full_name, :email, :phone_number, :if => :personal?
  validates_presence_of :location_name, :company_name, :address, :if => :location?
  validates_presence_of :password, :password_confirmation, :if => :password?

  after_create :init_user_profile

  attr_accessor :address, :company_name, :location_name, :user_id, :role_id, :location_id

  attr_writer :current_step

  def personal?
    current_step == "personal"
  end
  
  def location?
    current_step == "location"
  end

  def password?
    current_step == "password"
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[personal location password]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  private

  def init_user_profile
    unless self.invited_to_sign_up?
      location = Location.create(company_name: company_name, location_name: "HQ", address: address)
      UsersRole.create!(user_id: id, role_id: 2, location_id: location.id)
      UsersRole.create!(user_id: id, role_id: 3, location_id: location.id)
      UsersRole.create!(user_id: id, role_id: 7, location_id: location.id)
    end
  end

end
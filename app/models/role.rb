# == Schema Information
#
# Table name: roles
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  resource_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resource_id   :bigint(8)
#
# Indexes
#
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id)
#  index_roles_on_resource_type_and_resource_id           (resource_type,resource_id)
#

class Role < ApplicationRecord
has_and_belongs_to_many :users, :join_table => :users_roles


belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource_type,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify

has_many :users_roles
has_many :users, through: :users_roles
has_many :locations, through: :users_roles

scope :super_admin, -> {find_by(name: 'Super Admin')}
scope :global_admin, -> {find_by(name: 'Global Admin')}
scope :location_admin, -> {find_by(name: 'Location Admin')}
scope :front_desk_admin, -> {find_by(name: 'Front Desk Admin')}
scope :security_admin, -> {find_by(name: 'Security Admin')}
scope :billing_admin, -> {find_by(name: 'Billing Admin')}
scope :employee, -> {find_by(name: 'Employee')}

end

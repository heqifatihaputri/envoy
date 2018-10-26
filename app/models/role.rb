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

end

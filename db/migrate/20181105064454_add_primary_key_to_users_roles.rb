class AddPrimaryKeyToUsersRoles < ActiveRecord::Migration[5.2]
  def self.up
  add_column :users_roles, :id, :primary_key
  end

  def self.down
  remove_column :users_roles, :id
  end
end

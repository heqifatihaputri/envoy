class ChangeTypeDataTableUsersRoles < ActiveRecord::Migration[5.2]
  def change
    change_column :users_roles, :user_id, :integer
    change_column :users_roles, :role_id, :integer
  end
end

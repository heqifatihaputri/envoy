class AddLocationIdToUsersRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :users_roles, :location_id, :integer
  end
end

class RemoveHostFromInvites < ActiveRecord::Migration[5.2]
  def change
    remove_column :invites, :host
  end
end

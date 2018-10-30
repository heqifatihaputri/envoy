class RemoveHostFromVisitors < ActiveRecord::Migration[5.2]
  def change
    remove_column :visitors, :host
  end
end

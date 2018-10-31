class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :assistant_email
      t.datetime :delete_at
      t.integer :location_id

      t.timestamps
    end
  end
end

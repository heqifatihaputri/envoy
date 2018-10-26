class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.integer :location_id
      t.datetime :arrival
      t.string :full_name
      t.string :email_visitor
      t.string :host
      t.text :private_notes
      t.datetime :sign_in_time
      t.boolean :signed_in, default: false

      t.timestamps
    end
  end
end

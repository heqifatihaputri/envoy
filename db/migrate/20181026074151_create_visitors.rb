class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :your_full_name
      t.string :your_email_address
      t.text :purpose_of_visit
      t.string :photo_url
      t.string :host
      t.integer :location_id
      t.text :private_notes
      t.datetime :sign_in_time
      t.datetime :sign_out_time
      t.boolean :signed_in, default: false
      t.boolean :signed_out, default: false

      t.timestamps
    end
  end
end

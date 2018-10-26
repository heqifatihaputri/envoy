json.extract! invite, :id, :location_id, :arrival, :full_name, :email_visitor, :host, :private_notes, :sign_in_time, :created_at, :updated_at
json.url invite_url(invite, format: :json)

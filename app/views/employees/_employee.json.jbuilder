json.extract! employee, :id, :full_name, :email, :phone_number, :assistant_email, :delete_at, :location_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)

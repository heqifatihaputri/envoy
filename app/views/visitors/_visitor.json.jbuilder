json.extract! visitor, :id, :your_full_name, :your_email_address, :purpose_of_visit, :photo_url, :host, :location_id, :created_at, :updated_at
json.url visitor_url(visitor, format: :json)

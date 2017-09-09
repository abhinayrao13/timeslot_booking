json.extract! appointment, :id, :from_time, :to_time, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

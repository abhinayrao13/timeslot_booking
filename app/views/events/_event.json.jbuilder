json.extract! event, :reason, :date, :start_time, :end_time, :id, :created_at, :updated_at
json.url event_url(event, format: :json)

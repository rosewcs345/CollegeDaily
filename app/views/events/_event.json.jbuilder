json.extract! event, :id, :title, :host, :date, :start_time, :end_time, :location, :description, :created_at, :updated_at
json.url event_url(event, format: :json)

json.extract! event, :id, :title, :category, :host, :location, :description, :date, :start_time, :end_time, :traits, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)

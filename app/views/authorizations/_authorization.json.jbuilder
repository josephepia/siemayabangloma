json.extract! authorization, :id, :user_id, :operation_id, :resource_id, :created_at, :updated_at
json.url authorization_url(authorization, format: :json)

json.extract! credential, :id, :name, :login_id, :login_password, :created_by, :updated_by, :created_at, :updated_at
json.url credential_url(credential, format: :json)

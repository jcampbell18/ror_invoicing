json.extract! user, :id, :username, :password, :access_level_id, :company_id, :name, :phone, :phone_ext, :email, :created_at, :updated_at
json.url user_url(user, format: :json)

json.extract! user, :id, :name, :created_at, :updated_at, :discreption, :email, :location, :password, :role
json.url user_url(user, format: :json)

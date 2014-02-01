json.array!(@users) do |user|
  json.extract! user, :id, :uid
  json.url user_url(user, format: :json)
end

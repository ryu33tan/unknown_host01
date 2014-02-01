json.array!(@rooms) do |room|
  json.extract! room, :id, :user1_id, :Room, :user2_id
  json.url room_url(room, format: :json)
end

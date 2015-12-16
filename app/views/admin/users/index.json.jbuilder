json.array!(@admin_users) do |admin_user|
  json.extract! admin_user, :id, :username, :password_digest, :level
  json.url admin_user_url(admin_user, format: :json)
end

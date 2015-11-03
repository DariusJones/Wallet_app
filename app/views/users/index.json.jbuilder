json.array!(@users) do |user|
  json.extract! user, :id, :fname, :lname, :email, :password, :birth_month, :birth_day, :balance, :phone
  json.url user_url(user, format: :json)
end

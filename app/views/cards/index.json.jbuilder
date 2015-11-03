json.array!(@cards) do |card|
  json.extract! card, :id, :number, :exp_year, :exp_month, :card_type
  json.url card_url(card, format: :json)
end

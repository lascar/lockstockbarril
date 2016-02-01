json.array!(@resources) do |stock|
  json.extract! stock, :id
  json.url stock_api_url(stock, format: :json)
end

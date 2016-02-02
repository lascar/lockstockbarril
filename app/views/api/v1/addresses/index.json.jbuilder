json.array!(@resources) do |address|
  json.extract! address, :id
  json.url address_api_url(address, format: :json)
end

json.array!(@resource) do |supply|
  json.extract! supply, :id
  json.url supply_api_url(supply, format: :json)
end

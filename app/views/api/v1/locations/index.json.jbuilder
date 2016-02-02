json.array!(@resources) do |location|
  json.extract! location, :id
  json.url location_api_url(location, format: :json)
end

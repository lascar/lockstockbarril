json.array!(@resources) do |brand|
  json.extract! brand, :id
  json.url brand_url(brand, format: :json)
end

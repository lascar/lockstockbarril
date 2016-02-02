json.array!(@resources) do |supplier|
  json.extract! supplier, :id
  json.url api_supplier_url(supplier, format: :json)
end

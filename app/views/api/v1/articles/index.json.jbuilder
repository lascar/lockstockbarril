json.array!(@resources) do |article|
  json.extract! article, :id
  json.url article_api_url(article, format: :json)
end

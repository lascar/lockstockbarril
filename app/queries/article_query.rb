# queries for articles must be defined in model Articles if it is not a 'where query'
class ArticleQuery
  include Singleton
  QUERY_MAPPING = {
    reference: :where_reference,
    as_reference: :as_reference,
    as_brand_name: :as_brand_name
  }

  # we will extend it
  module Scopes
  end

  def filter(articles, queries)
    articles = querify(articles)
    queries.each_pair do |key, value|
      articles = dispatch_filter(articles, key, value)
    end
    articles
  end

  def querify(articles = Article.all)
    articles.extending(self.class::Scopes)
  end

  private
  def dispatch_filter(articles, key, value)
    method_map = self.class::QUERY_MAPPING[key.to_sym]
    method_map_to_s = method_map.to_s
    where_query = method_map_to_s.match(/^where_(?<attribute>.*)$/)
    if where_query
      articles.where(where_query[:attribute] => value)
    else
      Article.respond_to?(method_map_to_s) ? articles.send(method_map, value) : articles
    end
  end
end

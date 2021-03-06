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
    where_query = method_map.to_s.match(/^where_(?<attribute>.*)$/)
    return articles unless (where_query || Article.respond_to?(method_map.to_s))
    if where_query
      articles.where(where_query[:attribute] => value)
    else
      articles.send(method_map, value)
    end
  end
end

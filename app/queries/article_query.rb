# queries for articles
class ArticleQuery
  QUERY_MAPPING = {
    reference: :where_reference
  }

  module Scopes
  end

  def filter(articles, query)
    articles = querify(articles)
    query.each_pair do |key, value|
      articles = dispatch_filter(articles, key, value)
    end
    articles
  end

  def querify(articles = all_articles)
    articles.extending(self.class::Scopes)
  end

  private
  def dispatch_filter(articles, key, value)
    method_map = self.class::QUERY_MAPPING[key]
    return articles unless method_map
    where_query = method_map.to_s.match(/^where_(?<attribute>.*)$/)
    if where_query
      articles.where(where_query[:attribute] => value)
    else
      articles.send(method_map, value)
    end
  end

  def all_articles
    Article.all
  end
end

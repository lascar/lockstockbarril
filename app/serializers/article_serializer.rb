# article_serializer serialize one article
class ArticleSerializer < ActiveModel::Serializer

  attributes :reference, :url
  has_one :brand

  def url 
    api_article_url(object)
  end  

end

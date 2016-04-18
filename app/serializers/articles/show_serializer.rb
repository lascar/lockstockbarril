# article_serializer serialize one article
class Articles::ShowSerializer < ActiveModel::Serializer

  root :article
  attributes :reference, :url
  has_one :brand

  def url 
    api_article_url(object)
  end  

end

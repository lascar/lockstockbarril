# article_serializer serialize one article
class Articles::IndexSerializer < ActiveModel::Serializer

  attributes :id, :reference, :url, :brand_id, :brand_name, :brand_url

  def url 
    api_article_url(object)
  end  

  def brand_name
    object.brand.name
  end

  def brand_url
    api_brand_url(object.brand)
  end
end

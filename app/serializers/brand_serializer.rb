# brand_serializer serialize one brand
class BrandSerializer < ActiveModel::Serializer

  attributes :name, :url

  def url 
    api_brand_url(object)
  end  

end

# brand_serializer serialize one brand
class Brands::ShowSerializer < ActiveModel::Serializer

  attributes :name, :url

  def url 
    api_brand_url(object)
  end  

end

# app/serializers/brand_serializer.rb
class BrandSerializer < ActiveModel::Serializer

  attributes :name, :url

  def url 
    api_brand_url(object)
  end  

end

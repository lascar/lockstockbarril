# app/serializers/location_serializer.rb
class LocationSerializer < ActiveModel::Serializer

  attributes :name, :url

  def url 
    api_address_url(object)
  end  

end

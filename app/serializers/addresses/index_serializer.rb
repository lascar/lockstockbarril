# address_serializer serialize one address
class Addresses::IndexSerializer < ActiveModel::Serializer

  attributes :id, :zipcode, :town, :state, :country, :url

  def url 
    api_address_url(object)
  end  

end

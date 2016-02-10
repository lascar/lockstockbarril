# app/serializers/supply_serializer.rb
class SupplySerializer < ActiveModel::Serializer

  attributes :ref_supplier, :price, :url

  def url 
    api_supply_url(object)
  end  

end

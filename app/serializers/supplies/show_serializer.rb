# supply_serializer serialize one supply
class Supplies::ShowSerializer < ActiveModel::Serializer

  attributes :ref_supplier, :price, :url
  has_one :article
  has_one :supplier

  def url 
    api_supply_url(object)
  end  

end

# supply_serializer serialize one supply
class SuppliesInWarehouse::ShowSerializer < ActiveModel::Serializer

  attributes :bought_price_unit, :quantity, :bought_date, :url
  has_one :article
  has_one :supply
  has_one :location

  def url 
    api_supply_in_warehouse_url(object)
  end  

end

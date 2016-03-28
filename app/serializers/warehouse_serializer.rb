# warehouse_serializer serialize one warehouse
class WarehouseSerializer < ActiveModel::Serializer
  attributes :name, :capacity, :url
  has_one :address
  has_many :locations

  def url 
    api_warehouse_url(object)
  end  

end

# stock_serializer serialize one stock
class StockSerializer < ActiveModel::Serializer
  attributes :name, :capacity, :url
  has_one :address
  has_many :locations

  def url 
    api_stock_url(object)
  end  

end

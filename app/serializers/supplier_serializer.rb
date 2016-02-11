# supplier_serializer serialize one supplier
class SupplierSerializer < ActiveModel::Serializer
  embed :ids # the supplies will be embeded to avoid supply => supplier => [supply => supplier, supply...]
  attributes :name, :url
  has_one :address
  has_many :supplies

  def url 
    api_supplier_url(object)
  end  

end

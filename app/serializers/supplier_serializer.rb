# app/serializers/supplier_serializer.rb
class SupplierSerializer < ActiveModel::Serializer

  attributes :name, :url
  has_one :address
  has_many :supplies

  def url 
    api_supplier_url(object)
  end  

end

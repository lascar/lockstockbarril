# app/serializers/addresses_serializer.rb
class AddressesSerializer < ActiveModel::Serializer

  attributes :id, :zipcode, :town, :state, :country

end

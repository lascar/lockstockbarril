class Api::V1::AddressesController < Api::V1::ApplicationController
  include CRUD
  resource_name 'address'
  permitted_attributes [:id, :street, :street_number, :additional_information, :zipcode, :town, :state, :country]
end

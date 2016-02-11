class Api::V1::AddressesController < ApplicationController
  include CRUD
  resource_name 'address'
  permitted_attributes [:id, :street, :street_number, :additional_information, :zipcode, :town, :state, :country]
end

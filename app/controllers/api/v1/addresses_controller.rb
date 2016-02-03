class Api::V1::AddressesController < ApplicationController
  include CRUD
  resource_name 'address'
  additional_resources []
  permitted_attributes [:street, :street_number, :additional_information, :zipcode, :town, :state, :country]
end

class Api::V1::WarehousesController < ApplicationController
  include CRUD
  resource_name 'warehouse'
  permitted_attributes [:name, :capacity, address_attributes: [:id, :street, :street_number, :additional_information, :zipcode, :town, :state, :country]]
end

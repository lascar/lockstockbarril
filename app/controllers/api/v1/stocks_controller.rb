class Api::V1::StocksController < ApplicationController
  include CRUD
  resource_name 'stock'
  additional_resources []
  permitted_attributes [:name, :capacity, address_attributes: [:id, :street, :street_number, :additional_information, :zipcode, :town, :state, :country]]
end

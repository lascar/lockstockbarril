class Api::V1::SuppliersController < ApplicationController
  include CRUD
  resource_name 'supplier'
  permitted_attributes [:name, address_attributes: [:id, :street, :street_number, :additional_information, :zipcode, :town, :state, :country], article_ids: []]
end

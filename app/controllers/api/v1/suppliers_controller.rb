class Api::V1::SuppliersController < ApplicationController
  include CRUD
  resource_name 'supplier'
  additional_resources ['article']
  additional_resources_for_create ['address']
  permitted_attributes [:name, address_attributes: [:id, :street, :street_number, :additional_information, :zipcode, :town, :state, :country], article_ids: []]
end

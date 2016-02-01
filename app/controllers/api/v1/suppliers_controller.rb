class Api::V1::SuppliersController < ApplicationController
  include CRUD
  resource_name 'supplier'
  additional_resources []
  permitted_attributes [:name]
end

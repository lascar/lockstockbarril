class Api::V1::BrandsController < ApplicationController
  include CRUD
  resource_name 'brand'
  additional_resources []
  permitted_attributes [:name]
end

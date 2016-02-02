class Api::V1::BrandsController < ApplicationController
  include CRUD
  resource_name 'brand'
  additional_resources []
  additional_resources_for_create []
  permitted_attributes [:name]
end

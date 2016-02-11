class Api::V1::BrandsController < ApplicationController
  include CRUD
  resource_name 'brand'
  permitted_attributes [:name]
end

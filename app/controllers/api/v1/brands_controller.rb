class Api::V1::BrandsController < Api::V1::ApplicationController
  include CRUD
  resource_name 'brand'
  permitted_attributes [:name]
end

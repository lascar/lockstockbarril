class Api::V1::LocationsController < ApplicationController
  include CRUD
  resource_name 'location'
  permitted_attributes [:name, :warehouse_id]
end

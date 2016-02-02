class Api::V1::LocationsController < ApplicationController
  include CRUD
  resource_name 'location'
  additional_resources ['stock']
  additional_resources_for_create []
  permitted_attributes [:name, :stock_id]
end

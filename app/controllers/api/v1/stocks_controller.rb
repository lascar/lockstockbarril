class Api::V1::StocksController < ApplicationController
  include CRUD
  resource_name 'stock'
  additional_resources []
  permitted_attributes [:name, :capacity]
end

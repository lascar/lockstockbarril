module Api
  module V1
    class BrandsController < ApplicationController
      include CRUD
      resource_name 'brand'
      additional_resources []
      permitted_attributes [:name]
    end
  end
end

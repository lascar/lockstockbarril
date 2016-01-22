class BrandsController < ApplicationController
  include CRUD

  permitted_attributes [:name]
end

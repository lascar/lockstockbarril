class Api::V1::ArticlesController < ApplicationController
  include CRUD
  resource_name 'article'
  additional_resources ['brand']
  permitted_attributes [:reference, :brand_id]
end

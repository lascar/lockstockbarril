class Api::V1::ArticlesController < ApplicationController
  include CRUD
  resource_name 'article'
  additional_resources ['brand', 'supplier']
  permitted_attributes [:reference, :brand_id, supplier_ids: []]
end

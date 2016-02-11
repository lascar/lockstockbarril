class Api::V1::ArticlesController < ApplicationController
  include CRUD
  resource_name 'article'
  permitted_attributes [:reference, :brand_id, supplier_ids: []]
end

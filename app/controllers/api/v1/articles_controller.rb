class Api::V1::ArticlesController < Api::V1::ApplicationController
  include CRUD
  resource_name 'article'
  permitted_attributes [:reference, :brand_id, supplier_ids: []]
end

class Api::V1::SuppliesController < ApplicationController
  include CRUD
  resource_name 'supply'
  additional_resources ['articles', 'suppliers']
  additional_resources_for_create []
  permitted_attributes [:price, :ref_supplier, :article_id, :supplier_id]
end

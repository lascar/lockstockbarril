class Api::V1::SuppliesController < Api::V1::ApplicationController
  include CRUD
  resource_name 'supply'
  permitted_attributes [:price, :ref_supplier, :article_id, :supplier_id]
end

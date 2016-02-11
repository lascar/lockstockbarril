class Api::V1::SuppliesController < ApplicationController
  include CRUD
  resource_name 'supply'
  permitted_attributes [:price, :ref_supplier, :article_id, :supplier_id]
end

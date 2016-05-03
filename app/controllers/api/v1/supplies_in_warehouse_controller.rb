class Api::V1::SuppliesInWarehouseController < Api::V1::ApplicationController
  include CRUD
  resource_name 'supply_in_warehouse'
  permitted_attributes [:article_id, :warehouse_id, :supply_id, :location_id, :bought_price_unit, :quantity, :bought_date]
end

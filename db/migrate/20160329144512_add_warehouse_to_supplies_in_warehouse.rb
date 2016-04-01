class AddWarehouseToSuppliesInWarehouse < ActiveRecord::Migration
  def change
    add_reference :supplies_in_warehouse, :warehouse, index: true, foreign_key: true
  end
end

class RenameStocksToWarehouses < ActiveRecord::Migration
  def change
    rename_table :stocks, :warehouse
    remove_foreign_key :locations, :stock
    remove_index :locations, column: [:name, :stock_id]
    remove_column :locations, :stock_id
    add_column :locations, :warehouse_id, :integer
    add_foreign_key :locations, :warehouse
    add_index :locations, [:name, :warehouse_id]

  end
end

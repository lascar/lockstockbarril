class RenameStocksToWarehouses < ActiveRecord::Migration
  def change
    rename_table :stocks, :warehouse
  end
end

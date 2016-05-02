class CreateSuppliesInWarehouse < ActiveRecord::Migration
  def change
    create_table :supplies_in_warehouse do |t|
      t.references :article, index: true, foreign_key: true, null: false
      t.references :supply, index: true, foreign_key: true, null: false
      t.references :location, index: true, foreign_key: true
      t.references :warehouse, index: true, foreign_key: true, null: false
      t.integer :bought_price_unit
      t.integer :quantity
      t.date :bought_date

      t.timestamps null: false
    end
  end
end

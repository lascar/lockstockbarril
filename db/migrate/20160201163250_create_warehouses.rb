class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name, default: ''
      t.decimal :capacity, precision: 10, scale: 1, default: 0.0

      t.timestamps null: false
    end
  end
end

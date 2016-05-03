class CreateWarehouses < ActiveRecord::Migration[5.0]
  def change
    create_table :warehouses do |t|
      t.string :name, default: ''
      t.integer :capacity, default: 0

      t.timestamps null: false
    end
  end
end

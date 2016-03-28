class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.belongs_to :warehouse, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :locations, [:name, :warehouse_id], unique: true
  end
end

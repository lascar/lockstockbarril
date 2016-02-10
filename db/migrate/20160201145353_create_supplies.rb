class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :ref_supplier, default: ''
      t.belongs_to :article, index: true, foreign_key: true
      t.belongs_to :supplier, index: true, foreign_key: true
      t.decimal :price, precision: 15, scale: 2, default: 0.0

      t.timestamps null: false
    end
    add_index :supplies, [:ref_supplier, :supplier_id], unique: true
  end
end

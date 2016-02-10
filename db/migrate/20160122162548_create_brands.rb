class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, default: ''

      t.timestamps null: false
    end
    add_index :brands, :name, unique: true
  end
end

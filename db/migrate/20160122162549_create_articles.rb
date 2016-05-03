class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :reference, default: ''
      t.references  :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :articles, [:reference, :brand_id], unique: true
  end
end

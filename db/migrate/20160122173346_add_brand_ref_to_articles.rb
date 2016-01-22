class AddBrandRefToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :brand, index: true, foreign_key: true
    add_index :articles, [:reference, :brand_id], unique: true
  end
end

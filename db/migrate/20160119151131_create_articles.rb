class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :reference

      t.timestamps null: false
    end
  end
end

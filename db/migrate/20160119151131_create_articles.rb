class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :reference, default: ''

      t.timestamps null: false
    end
  end
end

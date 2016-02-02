class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street_number
      t.string :additional_information
      t.string :zipcode
      t.string :town, default: 'Madrid'
      t.string :state, default: 'Madrid'
      t.string :country, default: 'España'

      t.timestamps null: false
    end
  end
end

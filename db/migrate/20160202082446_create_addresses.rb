class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, default: ''
      t.string :street_number, default: ''
      t.string :additional_information, default: ''
      t.string :zipcode, default: ''
      t.string :town, default: 'Madrid'
      t.string :state, default: 'Madrid'
      t.string :country, default: 'España'
      t.references :addresseable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end

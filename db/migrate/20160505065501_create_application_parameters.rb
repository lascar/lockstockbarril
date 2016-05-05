class CreateApplicationParameters < ActiveRecord::Migration[5.0]
  def change
    create_table :application_parameters do |t|
      t.string :param
      t.string :value

      t.timestamps
    end
    add_index :application_parameters, :param, unique: true
  end
end

class AddUserSecretToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_secret, :string
    add_column :users, :server_secret, :string
  end
end

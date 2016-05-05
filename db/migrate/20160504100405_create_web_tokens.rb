class CreateWebTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :web_tokens do |t|
      t.string :user_email
      t.string :token
      t.integer :expiry_time
    end
  end
end

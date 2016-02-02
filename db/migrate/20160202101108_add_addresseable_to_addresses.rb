class AddAddresseableToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :addresseable, polymorphic: true, index: true
  end
end

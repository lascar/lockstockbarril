require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Api::V1::WarehousesController, type: :controller do
  describe 'when the user is authenticated' do
    let(:warehouse) { create(:warehouse) }
    let(:supply) { create(:supply, price: 10) }

    it '#add_supply' do
      post :add_supply, id: warehouse.id, supply: {id: supply.id, unit_price: 20, quantity: 2, date: Date.today - 2.months}

      expect(warehouse.supplies_in_warehouse.count).to eq(1)
      expect(warehouse.supplies_in_warehouse.first.bought_price_unit).to eq(20)
      expect(warehouse.supplies_in_warehouse.first.bought_date).to eq(Date.today - 2.months)
    end

    it '#remove_supply' do
      supply_in_warehouse = create(:supply_in_warehouse, warehouse: warehouse)

      delete :remove_supply, id: warehouse.id, supply_in_warehouse_id: supply_in_warehouse.id

      expect(warehouse.supplies_in_warehouse.count).to eq(0)
    end
  end
end

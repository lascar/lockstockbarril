require 'rails_helper'

RSpec.describe Api::V1::WarehousesController, type: :controller do
  let(:warehouse) { create(:warehouse) }
  let(:supply) { create(:supply, price: 10) }

  before :each do
    put_headers_for_auth(request.headers)
  end

  it '#add_supply' do
    post :add_supply, params: { id: warehouse.id, supply_in_warehouse: { supply_id: supply.id, bought_price_unit: 20, quantity: 2, bought_date: Date.today - 2.months} }

    expect(warehouse.supplies_in_warehouse.count).to eq(1)
    expect(warehouse.supplies_in_warehouse.first.bought_price_unit).to eq(20)
    expect(warehouse.supplies_in_warehouse.first.bought_date).to eq(Date.today - 2.months)
  end

  describe 'with a no existante warehouse' do
    it 'failed to add supply' do
      post :add_supply, params: { id: warehouse.id + 1, supply_in_warehouse: {id: supply.id, bought_price_unit: 20, quantity: 2, bought_date: Date.today - 2.months} }
      supply_in_warehouse_response = json_response
      expect(supply_in_warehouse_response[:warehouse]).to include("must refere to existing object!")
    end
  end

  describe 'with a no existante supply' do
    it 'failed to add supply' do
      post :add_supply, params: { id: warehouse, supply_in_warehouse: {id: supply.id + 1, bought_price_unit: 20, quantity: 2, bought_date: Date.today - 2.months} }
      supply_in_warehouse_response = json_response
      expect(supply_in_warehouse_response[:supply]).to include("must refere to existing object!")
    end
  end

  describe 'with no existent warehouse' do
    it '#remove_supply' do
      supply_in_warehouse = create(:supply_in_warehouse, warehouse: warehouse)

      delete :remove_supply, params: { id: warehouse.id + 1, supply_in_warehouse_id: supply_in_warehouse.id }

      expect(response.status).to eq(404)
      expect(warehouse.supplies_in_warehouse.count).to eq(1)
    end
  end

  describe 'with non existent supply_in_warehouse' do
    it '#remove_supply' do
      supply_in_warehouse = create(:supply_in_warehouse, warehouse: warehouse)

      delete :remove_supply, params: { id: warehouse.id, supply_in_warehouse_id: supply_in_warehouse.id + 1 }

      expect(response.status).to eq(404)
      expect(warehouse.supplies_in_warehouse.count).to eq(1)
    end
  end

  describe 'with existents warehouse and supply_in_warehouse' do
    it '#remove_supply' do
      supply_in_warehouse = create(:supply_in_warehouse, warehouse: warehouse)

      delete :remove_supply, params: { id: warehouse.id, supply_in_warehouse_id: supply_in_warehouse.id }

      expect(response.status).to eq(204)
      expect(warehouse.supplies_in_warehouse.count).to eq(0)
    end
  end

  describe 'when an address is given with' do
    let(:warehouse_attributes) {attributes_for(:warehouse) }
    let(:address_attributes) {attributes_for(:address) }
    let(:warehouse) { create(:warehouse) }
    let(:address) { create(:address) }

    it 'creates with this address' do
      post :create, params: { warehouse: warehouse_attributes.merge(address_attributes: address_attributes) }

      expect(Warehouse.last.address.street).to eq(address_attributes[:street])
    end

    it 'can modifies the address' do
      patch :update, params: { id: warehouse.id,
                       warehouse: {address_attributes: { street: 'calle Alcala' } } }
      warehouse.reload

      expect(warehouse.address.street).to eq('calle Alcala')
    end
  end
end

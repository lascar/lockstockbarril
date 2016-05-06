require 'rails_helper'

RSpec.describe Api::V1::SuppliersController, type: :controller do
  before :each do
    put_headers_for_auth(request.headers)
  end

  describe 'when an address is given with' do
    let(:supplier_attributes) {attributes_for(:supplier) }
    let(:address_attributes) {attributes_for(:address) }
    let(:supplier) { create(:supplier) }
    let(:address) { create(:address) }

    it 'creates with this address' do
      post :create, params: { supplier: supplier_attributes.merge(address_attributes: address_attributes) }

      expect(Supplier.last.address.street).to eq(address_attributes[:street])
    end

    it 'can modifies the address' do
      patch :update, params: { id: supplier.id,
                       supplier: {address_attributes: { street: 'calle Alcala' } } }
      supplier.reload

      expect(supplier.address.street).to eq('calle Alcala')
    end
  end
end

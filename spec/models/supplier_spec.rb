require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it 'have always an address' do
    supplier = create(:supplier)
    supplier.reload

    expect(supplier.address).to be_kind_of(Address)
  end
end

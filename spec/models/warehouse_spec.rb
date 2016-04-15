require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  it 'have always an addresse' do
    warehouse = create(:warehouse)
    warehouse.reload

    expect(warehouse.address).to be_kind_of(Address)
  end

end

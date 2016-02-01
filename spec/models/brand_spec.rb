require 'rails_helper'

RSpec.describe Brand, type: :model do
  context 'a brand existing' do
    let!(:brand1) { create(:brand, name: 'test1') }

    it 'does not allow to create a brand with the same name' do
      expect {
        create(:brand, name: 'test1' )
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end

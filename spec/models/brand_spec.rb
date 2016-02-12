require 'rails_helper'

RSpec.describe Brand, type: :model do
  context 'a brand existing' do
    let!(:brand1) { create(:brand, name: 'test1') }
    let!(:brand2) { create(:brand, name: 'brand 2') }

    it 'does not allow to create a brand with the same name' do
      expect {
        create(:brand, name: 'test1' )
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    describe ".filter_by_name" do
      it "returns the products matching" do
        expect(Brand.filter_by_name("test").sort).to match_array([brand1])
      end
    end

  end
end

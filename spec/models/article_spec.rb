require 'rails_helper'

RSpec.describe Article, type: :model do
  context "a brand existing" do
    let!(:brand1) { create(:brand, name: 'test1') }
    let!(:article1) { create(:article, reference: 'test1', brand: brand1) }

    it 'does not allow to create a brand with the same name' do
      expect {
        create(:article, reference: 'test1', brand: brand1 )
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end

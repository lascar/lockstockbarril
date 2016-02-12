require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'a brand existing' do
    let!(:brand1) { create(:brand, name: 'brand 1') }
    let!(:brand2) { create(:brand, name: 'test 2') }
    let!(:article1) { create(:article, reference: 'test 1', brand: brand1) }
    let!(:article2) { create(:article, reference: 'article 2', brand: brand2) }
    let!(:article3) { create(:article, reference: 'article 3', brand: brand1) }
    let!(:article4) { create(:article, reference: 'test 4', brand: brand1) }

    it 'does not allow to create a brand with the same name' do
      expect {
        create(:article, reference: 'test 1', brand: brand1 )
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    describe ".filter_by_reference" do
      it "returns the products matching" do
        expect(Article.filter_by_reference("TeSt").sort).to match_array([article1, article4])
      end
    end

    describe ".filter_by_brand" do
      it "returns the products matching" do
        expect(Article.filter_by_brand("RAn").sort).to match_array([article1, article3, article4])
      end
    end

    describe ".filter_by_reference.filter_by_brand" do
      it "returns the products matching" do
        expect(Article.filter_by_brand("RAn").filter_by_reference('Tic').sort).to match_array([article3])
      end
    end
  end
end

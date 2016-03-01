require 'rails_helper'

describe ArticleQuery, type: :query do

  it 'filters resources mapping query keys to internal method names and passing query value as argument' do
    stub_const("ArticleQuery::QUERY_MAPPING", id_eq: :id_equal)
    ArticleQuery::Scopes.class_eval do
      def id_equal(id)
         where(id: id)
      end
    end

    FactoryGirl.create(:article, id: 1)
    FactoryGirl.create(:article, id: 2)
    
    expect(ArticleQuery.new.filter(Article.all, id_eq: 1)).to eq(Article.where(id: 1))
  end
end

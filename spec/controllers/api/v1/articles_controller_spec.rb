# spec/controllers/api/v1/articles_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do

  let(:valid_attributes) {
    attributes_for :article
  }

  let(:new_valid_attributes) {
    attributes_for :article
  }

  let(:invalid_attributes) {
    attributes_for :article_invalid_request
  }

  describe 'user not auth' do
    describe 'GET #index' do
      before(:each) do
        4.times { create :article }
        get :index
      end
      it 'returns 4 records from the database' do
        articles_response = json_response
        expect(articles_response[:articles].count).to eq 4
      end
      it { is_expected.to respond_with 200 }
    end

    describe 'GET #show' do
      before(:each) do
        @article = create :article
        get :show, id: @article.id
      end
      it 'returns the information about a reporter on a hash' do
        article_response = json_response
        expect(article_response[:article][:reference]).to eql @article.reference
      end
      it { is_expected.to respond_with 200 }
    end

    it '#create redirect to sign_in' do
      post :create, {article: valid_attributes}
      expect(response.status).to eq 401
    end

    it '#update redirect to sign_in' do
      article = Article.create! valid_attributes
      put :update, {id: article.to_param, article: new_valid_attributes}
      expect(response.status).to eq 401
    end

    it '#delete redirect to sign_in' do
      article = Article.create! valid_attributes
      delete :destroy, {id: article.to_param}
      expect(response.status).to eq 401
    end
  end

  describe 'user auth' do
    before :each do
      @user = create :user
      api_authorization_header @user.access_token
    end

    describe 'POST #create' do
      context 'when is successfully created' do
        before(:each) do
          post :create, article: new_valid_attributes
        end

        it 'renders the json representation for the article record just created' do
          expect(json_response[:article][:reference]).to eql new_valid_attributes[:reference]
        end

        it { expect(response.status).to eq 201}
      end

      context 'when is not created' do
        before(:each) do
          post :create, article: invalid_attributes
        end

        it 'renders an errors json' do
          article_response = json_response
          expect(article_response).to have_key(:errors)
        end

        it 'renders the json errors on why the user could not be created' do
          article_response = json_response
          expect(article_response[:errors][:reference]).to include 'can\'t be blank'
        end
        
        it { expect(response.status).to eq 422 }
      end
    end

    describe 'PUT/PATCH #update' do
      before(:each) do
        @article = create :article
      end

      context 'when is successfully updated' do
        before(:each) do
          patch :update, { id: @article.id,
                           article: { reference: 'An expensive TV' } }
        end

        it 'renders the json representation for the updated user' do
          article_response = json_response
          expect(article_response[:article][:reference]).to eql 'An expensive TV'
        end

        it { expect(response.status).to eq 200 }
      end

      context 'when is not updated' do
        before(:each) do
          patch :update, { id: @article.id,
                           article: { reference: '' } }
        end

        it 'renders an errors json' do
          article_response = json_response
          expect(article_response).to have_key(:errors)
        end

        it 'renders the json errors on whye the user could not be created' do
          article_response = json_response
          expect(article_response[:errors][:reference]).to include 'can\'t be blank'
        end

        it { expect(response.status).to eq 422 }
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        @article = create :article
        delete :destroy, id: @article.id
      end
      it { expect(response.status).to eq 204 }
    end
  end
end

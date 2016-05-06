require 'rails_helper'

RSpec.describe Api::V1::ApplicationController, type: :controller do
  describe '#authorize private' do
    let(:user) { create(:user) }

    it 'is not call before action when its user#obtain_token' do
      @controller = Api::V1::UsersController.new

      post :obtain_token, params: { user: { email: user.email } }
      
      expect(json_response[:token]).to be_a_kind_of(String)
    end

    it 'render "Not authorized" when the header does not contains a valid user token' do
      @controller = Api::V1::ArticlesController.new
      get :index

      expect(json_response[:errors]).to eq('Not authorized')
    end
  end
end

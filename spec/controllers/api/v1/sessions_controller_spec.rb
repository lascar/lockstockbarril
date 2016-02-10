require 'rails_helper'
describe Api::V1::SessionsController do
  describe "POST #create" do
    before(:each) do
      @user = create :user
    end
    context "when the credentials are correct" do
      before(:each) do
        credentials = { email: @user.email, password: @user.password }
        post :create, { session: credentials }
      end
      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(json_response[:user][:access_token]).to eql @user.access_token
      end
      it { is_expected.to respond_with 200 }
    end
    context "when the credentials are incorrect" do
      before(:each) do
        credentials = { email: @user.email, password: "invalidpassword" }
        post :create, { session: credentials }
      end
      it "returns a json with an error" do
        expect(json_response[:errors]).to eql "Invalid email or password"
      end
      it { is_expected.to respond_with 422 }
    end
  end
  describe "DELETE #destroy" do
    before(:each) do
      @user = create :user
      sign_in @user
      delete :destroy, id: @user.access_token
    end
    it { is_expected.to respond_with 204 }
  end
end

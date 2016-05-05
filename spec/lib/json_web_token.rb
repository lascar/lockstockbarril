require 'rails_helper'

class DummyClass
end

describe JsonWebToken do
  let(:user) { create(:user) }

  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(JsonWebToken)
  end

  let(:token) { @dummy_class.send(:new_token, user.email) }

  describe '#new_token private' do
    it { expect(token.user_email).to eq(user.email) }
  end

  describe '#user_secret_encode' do
    it 'encodes the token with the user server_secret' do
      server_secret = user.server_secret
      encrypted_token = @dummy_class.server_secret_encode(user.email, server_secret)
      decripted_token = JWT.decode(encrypted_token, server_secret).first
      time_left_in_seconds = decripted_token['exp'] - Time.now.to_i

      expect(time_left_in_seconds).to be <= ApplicationParameter.find_by_param('token_encrypt_expirity_time').value.to_i
    end
  end

  describe '#verify_token' do
    it "verifies the token with the user's user_secret" do
      user_secret = user.server_secret
      payload = {user_encoded_token: token.token}
      payload['exp'] = token.expiry_time
      user_encoded_token = JWT.encode(payload, user_secret)

      verify = @dummy_class.verify_token(user.email, user_secret, user_encoded_token)
      expect(verify).to be true
    end
  end
end

module Request
  # parse json
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module WebTokenHelpers
    require 'jwt'
    def put_headers_for_auth(headers)
      user = create(:user)
      expirity_time = Time.now.to_i + ApplicationParameter.find_by_param('token_encrypt_expirity_time').value.to_i
      webtoken = WebToken.create(user_email: user.email, token: SecureRandom.base58(24), expiry_time: expirity_time)
      payload = {user_encoded_token: webtoken.token}
      payload['exp'] = webtoken.expiry_time
      user_encrypted_token = JWT.encode(payload, user.user_secret)
      headers["Token"] = user_encrypted_token
      headers['user_email'] = user.email
    end
  end
end

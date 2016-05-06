# the api auth use two keys, one is use by the server to send
# and the other by the user to send
module JsonWebToken
  require 'jwt'
  require 'active_support/core_ext/securerandom'

  def server_secret_encode(user_email, server_secret)
    webtoken = new_token(user_email)
    payload = {server_encoded_token: webtoken.token}
    payload['exp'] = webtoken.expiry_time
    secret_encode(payload, server_secret)
  end

  def verify_token(user_email, user_user_secret, user_encoded_token)
    user_token_decoded = user_token_encoded_decode(user_encoded_token, user_user_secret)
    webtoken = WebToken.find_by_user_email_and_token( user_email, user_token_decoded['user_encoded_token'] )
    if webtoken
      user_token_decoded['exp'] == webtoken.expiry_time
    else
      render json: { errors: 'Not authorized' }, layout: false
    end
  end

  private
  def new_token(user_email)
    WebToken.where(user_email: user_email).each{|webtoken| webtoken.destroy}
    expiry_time = Time.now.to_i + ApplicationParameter.find_by_param('token_encrypt_expirity_time').value.to_i
    WebToken.create(user_email: user_email, token: SecureRandom.base58(24), expiry_time: expiry_time)
  end

  def user_token_encoded_decode(user_encoded_token, user_user_secret)
    begin
      JWT.decode(user_encoded_token, user_user_secret).first
    rescue
        {'user_encoded_token': nil}
    end
  end
 
  def secret_encode(payload, server_secret)
    token = JWT.encode(payload, server_secret)
    render json: { token: token }
  end

end

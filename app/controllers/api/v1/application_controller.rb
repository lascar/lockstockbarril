# application controller for the api
class Api::V1::ApplicationController < ActionController::Base
  require 'json_web_token'
  include JsonWebToken
  protect_from_forgery with: :null_session
  before_action :authorize, except: :obtain_token
  after_action  :set_access_control_headers

  def set_access_control_headers
    headers["Access-Control-Allow-Origin"]  = root_url
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
  end

  private
  def authorize
    token = request.headers['Token']
    user_email = request.headers['user_email']
    user = User.find_by_email(user_email)
    user_secret = user ? user.user_secret : nil
    verify_token(user_email, user_secret, token)
  end
end

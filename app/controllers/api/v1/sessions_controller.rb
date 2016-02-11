# sessions_controller for login and logout
class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  # POST /v1/login
  def create
    params_session = params[:session]
    byebug
    user_password, user_email = params_session[:password], params_session[:email]
    user = user_email.present? && User.find_by(email: user_email)
    if user.valid_password? user_password
      sign_in_user(user)
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    # we do not want to give a clue if user exists
    if user = User.find_by(access_token: params[:id])
      user.generate_authentication_token!
      user.save
    end
    head 204
  end

  private
  def sign_in_user(user)
    sign_in user, store: false
    user.generate_authentication_token!
    user.save

    render json: user, status: 200, location: [:api, user]
  end
end

# users_controller no index
class Api::V1::UsersController < Api::V1::ApplicationController
  require 'json_web_token'
  include JsonWebToken

  def show
    render json: User.find(params[:id]), serializer: Users::ShowSerializer
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user], serializer: Users::ShowSerializer
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = User.find params[:id]
    if user && user.update(user_params)
      render json: user, status: 200, location: [:api, user], serializer: Users::ShowSerializer
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  def obtain_token
    user_email = user_params[:email]
    if user = User.find_by_email(user_email)
      server_secret_encode(user.email, user.server_secret) and return #! server_secret_encode render
    end
    render json: { errors: 'Not authorized' }
  end

  private
  def user_params
    params.require(:user).permit(:email, :name)
  end

end

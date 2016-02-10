# Devise methods overwrites
module Authenticable
  def current_user
    @current_user ||= User.find_by(access_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
      status: :unauthorized unless current_user.present?
  end

  # this method exists in device, it is there just for decoupling purpose
  def user_signed_in?
    current_user.present?
  end
end 

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include Authenticable

  respond_to :json

end

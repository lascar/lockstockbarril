class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  after_action  :set_access_control_headers

  def set_access_control_headers
    headers["Access-Control-Allow-Origin"]  = root_url
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
  end
end

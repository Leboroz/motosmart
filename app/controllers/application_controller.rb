class ApplicationController < ActionController::API
  include Response

  before_action :authorize_request

  private

  def authorize_request
    @current_user = Auth::AuthorizeApiRequest.new(request.headers).call[:user]
  rescue StandardError => e
    json_response({ errors: e.message }, 401)
  end
end

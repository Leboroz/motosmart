class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    response = Auth::AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(response[:message], response[:status])
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end

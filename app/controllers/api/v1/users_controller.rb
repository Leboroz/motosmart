class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    @user_ctx = Users::Create.call(params: user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

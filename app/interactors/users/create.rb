require 'securerandom'

class Users::Create
  include Interactor

  before do
    context.user_params ||= context.params
  end

  def call
    ActiveRecord::Base.transaction do
      create_user!
      create_token!
    end
  rescue StandardError => e
    handle_errors e.message
  end

  private

  def create_user!
    p = context.params
    return unless context.user_params && p[:password] == p[:password_confirmation]

    @user = User.new(name: p[:name], password: p[:password],
                     email: p[:email])
    @user.uuid = SecureRandom.uuid
    @user.save!
  end

  def create_token!
    token = JsonWebToken.encode(user_id: @user_id)
    context.message = {
      user: @user,
      token:
    }
    context.status = 201
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end

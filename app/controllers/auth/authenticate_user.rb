class Auth::AuthenticateUser
  include Message

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = get_user
    auth_token = JsonWebToken.encode(user_id: user.id) if user
    if auth_token
      return {
        message: {
          user: user.slice('id', 'name', 'email', 'uuid'),
          auth_token:
        },
        status: 200
      }
    end
    {
      message: {
        error: Message.invalid_credentials
      },
      status: 404
    }
  end

  private

  attr_reader :email, :password

  def get_user
    user = User.find_by(email:)
    @user = user if user.password == @password
  end
end

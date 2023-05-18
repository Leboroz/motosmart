require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :kilometer

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(raw)
    @password = Password.create(raw)
    self.password_digest = @password
  end
end

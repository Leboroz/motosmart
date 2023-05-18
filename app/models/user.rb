require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :kilometer

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(raw)
    @password = Password.create(raw)
    self.password_digest = @password
  end
end

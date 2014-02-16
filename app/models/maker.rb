require 'bcrypt'

class Maker

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  has n, :peeps, :through => Resource

  property :id, Serial
  property :name, String
  property :username, String, :unique => true, :message => 'This username has already been used'
  property :email, String, :unique => true, :message => 'This email has already been used'
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password

  def self.authenticate(username, password)
    maker = first(:username => username)
    if maker && BCrypt::Password.new(maker.password_digest) == password
      maker
    else
      nil
    end
  end
end

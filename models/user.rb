require_relative 'data_mapper_setup.rb'
require 'bcrypt'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true
  property :password_digest, Text, required: true

  has n, :properties, through: Resource

  validates_presence_of :password
  validates_confirmation_of :password_digest, :confirm => :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end

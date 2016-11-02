require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'property'
require_relative 'user'
require_relative 'request'
require_relative 'day'


  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/property'
require_relative 'models/user'
require_relative 'models/request'
require_relative 'models/day'
require_relative 'models/filter'


  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!

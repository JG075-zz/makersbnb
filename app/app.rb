ENV['RACK_ENV'] ||= 'development'

require 'dotenv'
Dotenv.load
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'time'

require_relative 'server'
require_relative 'controllers/requests'
require_relative 'controllers/sessions'
require_relative 'controllers/spaces'
require_relative 'controllers/users'

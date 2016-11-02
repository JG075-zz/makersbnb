require_relative 'data_mapper_setup.rb'

class Day
  include DataMapper::Resource

  property :id, Serial
  property :date, Date

  has n, :propertys, through: Resource
end

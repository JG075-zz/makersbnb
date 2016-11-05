require './app/data_mapper_setup'

class Day
  include DataMapper::Resource

  property :id, Serial
  property :date, Date

  has n, :propertys, through: Resource
end

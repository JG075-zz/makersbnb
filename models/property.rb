require_relative 'data_mapper_setup.rb'

class Property
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :location, String
  property :price, String
  property :description, Text

end

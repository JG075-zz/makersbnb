require_relative 'data_mapper_setup.rb'

class Property
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :location, String, required: true
  property :price, Integer, required: true
  property :description, Text

  belongs_to :user 
end

require_relative 'data_mapper_setup.rb'

class BookingRequest
  include DataMapper::Resource

  property :id, Serial

  belongs_to :property
end

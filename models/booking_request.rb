require_relative 'data_mapper_setup.rb'

class BookingRequest
  include DataMapper::Resource

  property :id, Serial
  property :booker_id, Integer

  belongs_to :property
end

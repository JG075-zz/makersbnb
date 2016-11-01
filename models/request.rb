require_relative 'data_mapper_setup.rb'

class Request
  include DataMapper::Resource

  property :id, Serial
  # property :booker_id, Integer

  belongs_to :property
end

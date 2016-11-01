require_relative 'data_mapper_setup.rb'

class Availability
  include DataMapper::Resource

  property :status, Boolean, :default => true

  belongs_to :property
end

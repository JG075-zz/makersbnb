require './app/data_mapper_setup'

class Request
  include DataMapper::Resource

  property :id, Serial
  property :booker_id, Integer
  property :start_date, Date
  property :end_date, Date

  belongs_to :property
end

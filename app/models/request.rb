require './app/data_mapper_setup'

class Request
  include DataMapper::Resource

  property :id, Serial
  property :booker_id, Integer
  property :start_date, Date
  property :end_date, Date

  belongs_to :property

  def self.accepting_requests(request)
    rent = Request.get(request)
    chosen_dates = Filter_Dates.new
    @days = chosen_dates.get_all_dates((rent.start_date.to_s),(rent.end_date.to_s))
    @filter_dates = chosen_dates.create_filter_dates_array
  end

  def self.property_is_available(property_id)
     (Property.get(property_id).days & @days) == @days
  end

  def self.remove_dates(property_id)
        @filter_dates.each do |day|
        remove_day = Property.get(property_id).days(:conditions => {:date => day})
        remove_day.destroy!
        Property.get(property_id).days(:conditions => {:date => day}).each do |x|
          Day.get(x.id).destroy!
        end
      end
  end
end

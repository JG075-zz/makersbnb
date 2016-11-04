class Filter_Dates
  attr_reader :start, :finish, :filter_dates
  attr_accessor :properties, :days

  def initialize
    @properties = []
    @filter_dates = []
    @days = []
    @available_days = []
  end

  def get_all_dates(start, finish)
    (Date.parse(start)..Date.parse(finish)).map(&:to_s).each do |day|
      @days << Day.first_or_create(date: day)
    end
  end

  def create_filter_dates_array
    @days.each do |y|
      @filter_dates << y.date
    end
    @filter_dates
  end

  def check_for_availability(start, finish)
    get_all_dates(start, finish)
    create_filter_dates_array
    Property.all.each do |property|
      property.days.each do |x|
        @available_days << x.date
      end
      if (@available_days & @filter_dates) == @filter_dates
        @properties << property
      end
    end
  end
end

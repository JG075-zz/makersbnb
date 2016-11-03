def filter_date(start, finish)
  @properties = []
  filter_dates = []
  days = []
  (Date.parse(start)..Date.parse(finish)).map(&:to_s).each do |day|
    days << Day.create(date: day)
  end
  days.each do |y|
    filter_dates << y.date
  end
  Property.all.each do |property|
    available_days = []
    property.days.each do |x|
      available_days << x.date
    end
    if (available_days & filter_dates) == filter_dates
      @properties << property
    end
  end
end

class MakersBnb < Sinatra::Base
  post '/requests/new' do
    property = params[:property]
    start_rent = params[:start_rent]
    end_rent = params[:end_rent]
    Request.create(booker_id: current_user.id, property_id: property, start_date: start_rent, end_date: end_rent)
    erb :'/requests/new'
  end

  get '/requests' do
    @made_requests = Property.all.requests(booker_id: current_user.id)
    user_properties = Property.all(user_id: current_user.id)
    @received_requests = user_properties.all.requests
    erb :'requests/index'
  end
  
  post '/accept' do
    property_id = params[:property]
    request_id = params[:request]
    rent = Request.get(request_id)
    filter_dates = []
    days = []
    (Date.parse(rent.start_date.to_s)..Date.parse(rent.end_date.to_s)).map(&:to_s).each do |day|
      days << Day.create(date: day)
    end
    days.each do |y|
      filter_dates << y.date
    end
    filter_dates.each do |day|
      remove_day = Property.get(property_id).days(:conditions => {:date => day})
      remove_day.destroy!
    end
    Request.get(request_id).destroy!
    redirect '/requests'
  end

  post '/decline' do
    request_id = params[:request]
    Request.get(request_id).destroy!
    redirect '/requests'
  end
end

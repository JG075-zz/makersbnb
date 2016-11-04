class MakersBnb < Sinatra::Base
  post '/requests/new' do
    @property = params[:property]
    Request.create(booker_id: current_user.id, property_id: @property, start_date: params[:start_rent], end_date: params[:end_rent])
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
    rent = Request.get(params[:request])
    chosen_dates = Dates.new
    chosen_dates.get_all_dates((rent.start_date.to_s),(rent.end_date.to_s))
    chosen_dates.create_filter_dates_array
    @days = chosen_dates.days
    @filter_dates = chosen_dates.filter_dates
      if (Property.get(property_id).days & @days) == @days
        @filter_dates.each do |day|
          remove_day = Property.get(property_id).days(:conditions => {:date => day})
          remove_day.destroy!
          Property.get(property_id).days(:conditions => {:date => day}).each do |x|
            Day.get(x.id).destroy!
          end
        end
      Request.get(params[:request]).destroy!
      redirect '/requests'
    else
      flash.now[:errors] = "Property has already been booked for these dates. Please decline."
      @made_requests = Property.all.requests(booker_id: current_user.id)
      user_properties = Property.all(user_id: current_user.id)
      @received_requests = user_properties.all.requests
      erb :'requests/index'
    end
end

  post '/decline' do
    request_id = params[:request]
    Request.get(request_id).destroy!
    redirect '/requests'
  end
end

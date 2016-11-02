class MakersBnb < Sinatra::Base
  post '/requests/new' do
    property = params[:property]
    if Property.get(property).availability == true
      Request.create(booker_id: current_user.id, property_id: property)
      redirect '/requests/new'
    else
      @properties = Property.all
      flash.now[:errors] = "This place has already been booked"
      erb :'/spaces/index'
    end
  end

  get '/requests' do
    @requests = Property.all.requests(booker_id: current_user.id)
    erb :'requests/index'
  end

  # RESTFUL URLS?

  post '/accept' do
    property_id = params[:property]
    request_id = params[:request]
    Property.get(property_id).update(:availability => false)
    Request.get(request_id).destroy!
    redirect '/requests'
  end

  post '/decline' do
    request_id = params[:request]
    Request.get(request_id).destroy!
    redirect '/requests'
  end
end

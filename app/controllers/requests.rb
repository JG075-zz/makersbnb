class MakersBnb < Sinatra::Base
  post '/requests/new' do
    property = params[:property]
    Request.create(booker_id: current_user.id, property_id: property)
    erb :'requests/new'
  end

  get '/requests' do
    @made_requests = Property.all.requests(booker_id: current_user.id)
    user_properties = Property.all(user_id: current_user.id)
    @received_requests = user_properties.all.requests
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

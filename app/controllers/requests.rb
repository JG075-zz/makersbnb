class MakersBnb < Sinatra::Base
  get '/requests/new' do
    erb :'requests/new'
  end

  post '/requests/new' do
    property = params[:property]
    Request.create(booker_id: current_user.id, property_id: property)
    redirect '/requests/new'
  end

  get '/requests' do
    @requests = Property.all.requests(booker_id: current_user.id)
    erb :'requests/index'
  end

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

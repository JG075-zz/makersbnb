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
end

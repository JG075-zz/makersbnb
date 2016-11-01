class MakersBnb < Sinatra::Base
  get '/spaces' do
    @properties = Property.all
    erb :'spaces/index'
  end

  post '/spaces' do
    property = Property.create(name: params[:name],
                                  location: params[:location],
                                  description: params[:description],
                                  price: params[:price], user_id: current_user.id)
    if property.save
      redirect '/spaces'
    else
      flash.now[:errors] = property.errors.full_messages
      erb :'spaces/new'
    end
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end
end

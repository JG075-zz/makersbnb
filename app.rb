require 'sinatra/base'

class MakersBnb < Sinatra::Base
  get '/' do
    'Hello MakersBnb!'
  end

  get '/spaces' do
    @properties = Property.all
    erb :spaces
  end

  post '/requests/new' do
    redirect '/requests'
  end

  get '/requests' do
    'Requests'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

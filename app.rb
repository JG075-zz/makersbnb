ENV['RACK_ENV'] ||= 'development'
require 'sinatra/flash'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class MakersBnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Hello MakersBnb!'
  end

  get '/spaces' do
    @properties = Property.all
    erb :'spaces/spaces'
  end

  post '/spaces' do
    @properties = Property.create(name: params[:name], location: params[:location], description: params[:description], price: params[:price])
    if @properties.save
      redirect '/spaces'
    else
      flash.now[:errors] = @properties.errors.full_messages
      erb :'spaces/new'
    end
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/requests/new' do
    redirect '/requests'
  end

  get '/requests' do
    'Request sent to owner!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

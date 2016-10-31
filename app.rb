ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require 'sinatra/flash'


class MakersBnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
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

  post '/users/new' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
      if user.save
        session[:user_id] = user.id
        redirect '/spaces'
      else
      flash.now[:errors] = user.errors.full_messages
      erb :index
    end
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

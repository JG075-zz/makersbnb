ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class MakersBnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

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
    erb :spaces
  end

  post '/users/new' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/spaces'
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

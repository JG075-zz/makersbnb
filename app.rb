ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require 'sinatra/flash'


class MakersBnb < Sinatra::Base
  use Rack::MethodOverride
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

  get '/users/new' do
    erb :'users/new'
  end

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
      erb :'users/new'
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/spaces'
    else
      flash.now[:errors] = "The email or password is incorrect"
      erb :index
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "You have successfully logged out"
    redirect to '/'
  end

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

  # start the server if ruby file executed directly
  run! if app_file == $0
end

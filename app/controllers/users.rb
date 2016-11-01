class MakersBnb < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
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
end

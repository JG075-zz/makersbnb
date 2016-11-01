class MakersBnb < Sinatra::Base
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
end

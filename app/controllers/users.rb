require './app/lib/send_email'

class MakersBnb < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    if params[:file] != nil
      @filename = params[:file][:filename]
      file = params[:file][:tempfile]

      File.open("app/public/uploads/#{@filename}", 'wb') do |f|
        f.write(file.read)
      end
      @image = "/uploads/#{@filename}"
    end

    user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation],
                       image: @image)
    if user.save
      session[:user_id] = user.id
      SendEmail.call(user)
      redirect '/spaces'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/profile' do
    erb :'profile/index'
  end
end

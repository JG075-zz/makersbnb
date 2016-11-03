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

  get "/upload" do
    erb :upload_image
  end

  post "/upload" do
    @filename = params[:file][:filename]
    file = params[:file][:tempfile]

    File.open("app/public/uploads/#{@filename}", 'wb') do |f|
      f.write(file.read)
    end

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

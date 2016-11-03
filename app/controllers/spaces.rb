require 'date'

class MakersBnb < Sinatra::Base
  get '/spaces' do
    @properties = Property.all
    erb :'spaces/index'
  end

  post '/spaces' do
    if params[:start_date] > params[:end_date]
      flash.now[:errors] = "Please enter valid dates."
      erb :'spaces/new'
    else
      property = Property.create(name: params[:name],
      location: params[:location],
      description: params[:description],
      price: params[:price], user_id: current_user.id)

      if property.save
        (Date.parse(params[:start_date])..Date.parse(params[:end_date])).map(&:to_s).each do |day|
          property.days << Day.first_or_create(date: day)
        end
        property.save
        redirect '/spaces'
      else
        flash.now[:errors] = property.errors.full_messages
        erb :'spaces/new'
      end
    end
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/spaces/mylistings' do
    @user_properties = Property.all(user_id: current_user.id)
    erb :'spaces/my_listings'
  end

  get '/spaces/filter' do
    if params[:start] > params[:end]
      flash.now[:errors] = "Please enter valid dates."
      @properties = Property.all
      erb :'spaces/index'
    else
      @start_rent = params[:start]
      @end_rent = params[:end]
      filter_date(params[:start], params[:end])
      erb :'spaces/filter'
    end
  end
end

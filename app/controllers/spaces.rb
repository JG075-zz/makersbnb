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

  get '/spaces/filter' do
    @start_rent = params[:start]
    @end_rent = params[:end]
    @properties = []
    filter_dates = []
    days = []
    (Date.parse(params[:start])..Date.parse(params[:end])).map(&:to_s).each do |day|
      days << Day.create(date: day)
    end
    days.each do |y|
      filter_dates << y.date
    end
    Property.all.each do |property|
      available_days = []
      property.days.each do |x|
        available_days << x.date
      end
      if (available_days & filter_dates) == filter_dates
        @properties << property
      end
    end
    erb :'spaces/filter'
  end
end

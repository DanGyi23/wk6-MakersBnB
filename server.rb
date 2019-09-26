require 'sinatra/base'
require './lib/properties.rb'
require './lib/users.rb'
require './lib/payment.rb'

require 'stripe'

# manages server routes - returns json data
class Server < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello world'
  end

  get '/properties' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    Properties.all_properties.to_json
  end

  get '/properties/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    Properties.get_property(id: params[:id]).to_json
  end

  get '/availability/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    Properties.get_availability(id: params[:id]).to_json
  end

  get '/book/:id/:date' do
    headers 'Access-Control-Allow-Origin' => '*'
    Properties.change_availability(id: params[:id], date: params[:date])
  end

  get '/bookingconfirm/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    Properties.property_info(id: params[:id], date: params[:date]).to_json
  end

  post '/signup' do
    headers 'Access-Control-Allow-Origin' => '*'
    user = Users.add_user(name: params[:name], email: params[:email], password: params[:password])
    if user == false
      halt 409
    else
    session[:user_id] = user.user_id
    end
  end

  post '/login' do
    headers 'Access-Control-Allow-Origin' => '*'
    user = Users.authenticate(email: params[:email], password: params[:password])
    if user == false
      halt 401
    else
      session[:user_id] = user.user_id
    end
  end

  post '/signout' do
    headers 'Access-Control-Allow-Origin' => '*'
    session.clear
  end

  post '/newlistingsubmit' do
    headers 'Access-Control-Allow-Origin' => '*'
    Properties.addnew(property_name: params[:property_name],
    price: params[:price],
    property_type: params[:property_type],
    property_description: params[:property_description],
    capacity: params[:capacity],
    location: params[:location],
    size: params[:size],
    bathrooms: params[:bathrooms],
    beds: params[:beds],
    wifi: params[:wifi],
    washing_machine: params[:washing_machine])
  end
end

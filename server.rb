require 'sinatra/base'
require './lib/properties.rb'
require './lib/users.rb'
# require 'jwt'
# require "sinatra/cookies"
require 'jwt'
require './lib/payment.rb'
require 'stripe'


# ENV['JWT_SECRET'] = 'myverysecuresecret123!'
# ENV['JWT_ISSUER'] = 'makersBNB.com'

# manages server routes - returns json data
class Server < Sinatra::Base
  # helpers Sinatra::Cookies
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
    content_type :json
    Properties.change_availability(id: params[:id], date: params[:date])
  end

  get '/bookingconfirm/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    Properties.property_info(id: params[:id], date: params[:date]).to_json
  end

  # get '/activeuser' do
  #   headers 'Access-Control-Allow-Origin' => '*'
  #   decoded_jwt = JWT.decode cookies[:jwt], ENV['JWT_SECRET'], true, { algorithm: 'HS256' }
  #   # p "value: #{decoded_jwt}"
  #   content_type :json
  #   decoded_jwt.to_json
  #
  #   # jwtcookie = cookies[:jwt]
  #   # p jwtcookie
  #
  #   # content_type :json
  #   # {"active": "true", "user": "Ben"}.to_json
  # end

  post '/signup' do
    headers 'Access-Control-Allow-Origin' => '*'
    user = Users.add_user(name: params[:name], email: params[:email], password: params[:password])
    if user == false
      halt 409
    end
  end

  post '/login' do
    headers 'Access-Control-Allow-Origin' => '*'
    user = Users.authenticate(email: params[:email], password: params[:password])
    if user == false
      halt 401
    else
      # content_type :json
      # { token: token(params[:email]) }.to_json
      session[:user] = params[:email]
      # p cookies[:jwt] = token(params[:email])
      # p cookies[:something] = 'foobar'


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

  # def token username
  #   JWT.encode payload(username), ENV['JWT_SECRET'], 'HS256'
  # end

  # def payload username
  #   {
  #       exp: Time.now.to_i + 60 * 60,
  #       iat: Time.now.to_i,
  #       iss: ENV['JWT_ISSUER'],
  #       scopes: ['admin'],
  #       user: {
  #           username: username
  #       }
  #   }
  # end
end

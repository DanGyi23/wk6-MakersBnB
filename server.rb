require 'sinatra/base'
require './lib/properties.rb'
require './lib/users.rb'

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

  get '/book/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    Properties.book_property(id: params[:id]).to_json
  end

  post '/signup' do
    headers 'Access-Control-Allow-Origin' => '*'
    user = Users.add_user(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.user_id
  end

  post '/login' do
    headers 'Access-Control-Allow-Origin' => '*'
    user = Users.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.user_id
  end

  post '/signout' do
    headers 'Access-Control-Allow-Origin' => '*'
    session.clear
  end
end

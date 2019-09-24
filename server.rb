require 'sinatra/base'
require './lib/properties.rb'

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
end

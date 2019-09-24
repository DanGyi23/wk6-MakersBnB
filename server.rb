require 'sinatra/base'
require './lib/properties.rb'

class Server < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello world"
  end

  get '/properties' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    @properties = Properties.all_properties
    @properties.to_json
  end

  get '/properties/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    @property = Properties.get_property(id: params[:id])
    @property.to_json
  end

  get '/book/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    Properties.book_property(id: params[:id]).to_json
  end
end

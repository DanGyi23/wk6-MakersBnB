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
    @properties = Properties.all
    @properties.to_json
  end

end
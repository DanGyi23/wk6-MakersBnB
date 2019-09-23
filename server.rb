require 'sinatra/base'
require './lib/properties.rb'

class Server < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello world"
  end

  get '/properties' do
    content_type :json
    @properties = Properties.all
    @properties.to_json
  end

end
require 'sinatra/base'

class Server < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello world"
  end

  get '/example' do
    content_type :json
    { :key1 => 'value1', :key2 => 'value2' }.to_json
  end

end
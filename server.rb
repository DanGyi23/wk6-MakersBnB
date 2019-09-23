require 'sinatra/base'

class Server < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello world"
  end

end
require 'sinatra/base'

class Server < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello World"
  end

end
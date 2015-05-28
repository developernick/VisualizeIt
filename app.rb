require 'bundler'
Bundler.require()

get '/' do
  erb :index
end

require './models/user'

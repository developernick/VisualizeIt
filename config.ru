require './app'
run Sinatra::Application

require "sinatra"
require "sinatra/reloader"

configure :production do
  enable :reloader
end

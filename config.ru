# ***GEMS***
require "sinatra"
require "sinatra/reloader"

configure :production do
  enable :reloader
end

require 'bundler'
Bundler.require()

# *** Connections ***
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'visuals_data'
)
# *** Helpers ***
require './helpers/sessions_helper'
# *** Models ***
require './models/user'


# *** Controllers ***
require "./controllers/application_controller"
require "./controllers/sessions_controller"
require "./controllers/users_controller"
require "./controllers/visuals_controller"

# *** Routing ***
map('/api/users') { run UsersController.new() }
map('/api/visuals') { run VisualsController.new() }
map('/sessions') { run SessionsController.new() }

map('/') { run ApplicationController.new() }

# Completed

# ***GEMS***
require "sinatra"
require "sinatra/reloader" if development?
require 'bundler'
Bundler.require()

# *** Connections ***
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'visual_data'
)

# *** Sesions***
enable(:sessions)
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
map('/users') { run UsersController.new() }
# map('/visuals') { run VisualsController.new() }
map('/sessions') { run SessionsController.new() }

map('/') { run ApplicationController.new() }
map('/app') { run ApplicationController.new() }
# Completed

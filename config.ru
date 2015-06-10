# ***GEMS***
require "sinatra"
require "sinatra/reloader" if development?
require 'bundler'
Bundler.require()

# *** Connections ***
db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/visual_data')
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
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

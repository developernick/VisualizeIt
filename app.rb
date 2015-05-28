require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'visuals_data'
)

require './models/user'

enable(:sessions)

# ****helpers****
def current_user
  if session[:current_user]
    User.find(session[:current_user])
  else
    nil
  end
end

def authenticate!
  redirect '/' unless current_user
end

get '/' do
  erb :index
end

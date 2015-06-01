class SessionsController < Sinatra::Base
  enable :sessions
  helpers Sinatra::SessionsHelper
  use Rack::MethodOverride

  ##   ***** Debugging *****
  # get '/pry' do
  #   binding.pry
  # end

  #-_-_-_-_-_-_-_-_-_-_- Routes -_-_-_-_-_-_-_-_-_-_-

  # get '/' do
  #   erb :index
  # end

  post '/' do
    user = User.find_by(:username => params[:username])
    if user && user.password == params[:password]
      session[:current_user] = user.id
      redirect '/'
    else
      redirect '/'
    end
  end

delete '/' do
   session[:current_user] = nil
   erb :index
  end

end # End SessionsController

# Completed

class SessionsController < Sinatra::Base
  enable :sessions
  helpers Sinatra::SessionHelper
  use Rack::MethodOverride


  ##   ***** Debugging *****
  # get '/pry' do
  #   binding.pry
  # end

  #-_-_-_-_-_-_-_-_-_-_- Routes -_-_-_-_-_-_-_-_-_-_-

  post '/' do
    user = User.find_by(:username => params[:username])
    if user && user.password == params[:password]
      sesson[:current_user] = user.id
      redirect '/'
    end
  end

  delete '/' do
    session[:current_user] = nil
    redirect '/'
  end

end

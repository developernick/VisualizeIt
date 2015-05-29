class ApplicationController < Sinatra::Base
	enable :sessions
	helpers Sinatra::SessionsHelper

	set :views, File.expand_path('../../views', __FILE__)
	set :public_folder, File.expand_path('../../public', __FILE__)

	# -_-_-_-_-_-_- Routes -_-_-_-_-_-_-

	get '/' do
		erb :index
	end

	get '/sign_up' do
		erb :new_user
	end
# -_-_-_-_-_-_- Helper -_-_-_-_-_-_-
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


end #Completed????

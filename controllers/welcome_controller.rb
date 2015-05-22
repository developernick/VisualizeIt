class WelcomeController < Sinatra::Base

	enable :sessions

	set :views, File.expand_path('../../views', __FILE__)
	set :public_folder, File.expand_path('../../public', __FILE__)



# -_-_-_-_-_-_- Routes -_-_-_-_-_-_-

	get '/' do
		erb :index
	end

	

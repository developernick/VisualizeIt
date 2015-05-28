class VisualsController < Sinatra::Base
	enable :sessions

	get '/one' do
		erb :visualization_master
	end


end

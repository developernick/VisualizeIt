class VisualsController < ApplicationController
	enable :sessions

	get '/one' do
		erb :visualization_master
	end


end

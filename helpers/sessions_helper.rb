module Sinatra
  module SessionHelper

    def current_user
      if session[:current_user]
        User.find(session[:current_user])
      else
        nil
      end
    end

    def authenticate_api!
      halt 403 unless current_user
    end

  end#--SessionHelper end

end #Sinatra end

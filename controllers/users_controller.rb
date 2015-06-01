class UsersController < ApplicationController

	def home
    authenticate!
    @user = current_user
  end

	get "/" do
		users = User.all
		content_type :json
		users.to_json
	end

	get "/:id" do
		user = User.find(params[:id].to_i)
		content_type :json
		user.to_json
	end

	post "/" do
		user = User.new(params[:user])
		user.password = params[:password]
		user.save!
		redirect '/'
	end

	put "/:id" do
		user = User.find(params[:id].to_i)
		user.update(params[:user])
		content_type :json
		user.to_json
	end

	patch "/:id" do
		user = User.find(params[:id].to_i)
		user.update(params[:user])
		content_type :json
		user.to_json
	end

	delete "/:id" do
		user = User.find(params[:id].to_i)
		user.destroy
		puts "User has been Destroyed!"
	end

	def profile
    authenticate!
    @user = current_user
  end

  def sign_in

  end

private

	def user_params
		params.require(:user).permit(:username, :password)
	end
end

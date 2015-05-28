class UsersController < ApplicationController


	get "/users" do
		user = Users.all
		content_type :json
		user.to_json
	end

	get "/users/:id" do
		user = User.find(params[:id].to_i)
		content_type :json
		user.to_json
	end

	post "/users" do
		user = User.new(params[:user])
		user.password= params[:password]
		user.save!
		redirect '/'
	end

	put "/users/:id" do
		user = User.find(params[:id].to_i)
		user.update(params[:user])
		content_type :json
		user.to_json
	end

	patch "/users/:id" do
		user = User.find(params[:id].to_i)
		user.update(params[:user])
		content_type :json
		user.to_json
	end

	delete "/users/:id" do
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

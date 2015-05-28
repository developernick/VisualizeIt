class UsersController < ApplicationController

	def home
		authenticate!
		@user = current_user
	end

	def index

	end

	def show

	end

	def update

	end

	def destroy

	end

	def profile

	end

	def login

	end

private

	def user_params

	end
end

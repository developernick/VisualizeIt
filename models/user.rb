class User < ActiveRecord:: Base

	include BCrypt

	def password
		@password ||= Password.new(self.password_hash)
	end

	def password=(new_password)
		@password ||= Password.new(self.password)
		self.password_hash = @password
	end

end

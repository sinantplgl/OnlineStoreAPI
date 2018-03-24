class AuthenticateUser
	prepend SimpleCommand

	def initialize(email, password)
		@email = email
		@password = password
	end

	def call
		if user
			JsonWebToken.encode(user_id: user.id)
		end
	end

	private

	attr_accessor :email, :password

	def user
		u = User.find_by_email(email)
		return u if u && u.authenticate(password)
		errors.add :user_authentication, 'Invalid Credentials'
		nil
	end
end
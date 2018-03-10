class AuthenticateUser
	prepend SimpleCommand

	def initialize(email, password)
		@email = email
		@password = password
	end

	def call
		if user
			puts user.id
			puts user.email
			JsonWebToken.encode(user_id: user.id)
		end
	end

	private

	attr_accessor :email, :password

	def user
		puts 6
		u = User.find_by_email(email)
		puts 7
		return u if u && u.authenticate(password)
		puts 8
		errors.add :user_authentication, 'Invalid Credentials'
		nil
	end
end
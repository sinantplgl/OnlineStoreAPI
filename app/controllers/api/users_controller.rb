class Api::UsersController < ApplicationController
	skip_before_action :authenticate_request, :only => [:create]
	def show
		render json:	@current_user, status: :ok
	end

	def create
		@user = User.new(user_params.except(:customer))
		@user.customer = Customer.new(user_params[:customer])
		begin
			@user.save
			render json:	@user, status: :ok
		rescue => ex
			render json: {message: ex.message}
		end
	end

	private

	def user_params
		customer_params = (params[:user] || {})[:customer].keys
		params.require(:user).permit(:name, :email, :password, :password_confirmation, customer: customer_params)
	end
end

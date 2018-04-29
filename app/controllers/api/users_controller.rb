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

	def changepass
		begin
			current_user.update(user_params.slice(:password, :password_confirmation))
			render json: {message: "Password updated..."}
		rescue => ex
			render json: {message: ex.message}
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, customer: [:home_address, :tax_id])
	end
end
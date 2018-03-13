class Api::UsersController < ApplicationController
	skip_before_action :authenticate_request, :only => [:create]
	def show
		@user = User.find(params[:id])
		@customer = Customer.find(@user.id)
		render json:	{	
							id: @user.id, 
							name: @user.name,
							email: @user.email, 
							home_address: @customer.home_address, 
							tax_id: @customer.tax_id
						}, status: :ok
	end

	def create
		@user = User.new(name: user_params[:name],
						email: user_params[:email],
						password: user_params[:password],
						password_confirmation: user_params[:password_confirmation])
		if User.find_by_email(@user.email)
			render json:	{
								status: 409,
								message: "Email already exist!"
							}
		elsif user_params[:home_address] && user_params[:tax_id]
			@user.save
			@customer = Customer.new(id: User.last.id,
							home_address: user_params[:home_address],
							tax_id: user_params[:tax_id])
			if @customer.save
				render json:	{
									status: 200,
									message: "New account created...",
									user:
									{	
										id: @user.id, 
										name: @user.name,
										email: @user.email, 
										home_address: @customer.home_address, 
										tax_id: @customer.tax_id
									}
								}
			else
				User.last.destroy
				render json:	{
									status: 500
									message: "Something happened..."
								}
			end
		else
			render json:	{
								status: 400,
								message: "Home Address and Tax ID cannot be empty!"
							}
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :home_address, :tax_id)
	end
end

class Api::UsersController < ApplicationController
	skip_before_action :authenticate_request, :only => [:create]
	def index
		@users = User.all

		render json: @users, status: :ok
	end

	def show
		@user = User.find(params[:id])
		
		render json: @user, status: :ok
	end

	def create
		@user = User.new(user_params)

		@user.save

		render json: @user, status: :created
	end

	def destroy
		@user = User.where(id: params[:id].first)
		if @user.destroy
			head(:ok)
		else
			head(:unprocessable_entry)
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end

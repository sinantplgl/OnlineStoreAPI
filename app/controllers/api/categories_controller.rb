class Api::CategoriesController < ApplicationController
	skip_before_action :authenticate_request

	def index
		@categories = Category.all

		render json: @categories
	end

	def products
		@products = Category.find(params[:id]).products

		render json: @products
	end
end

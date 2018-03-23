class Api::ProductsController < ApplicationController
	skip_before_action :authenticate_request, :only => [:index, :show]

	def index
		@products = Product.all

		render json: @products, status: :ok
	end

	def create
		@manager = ProductManager.where(user_id: @current_user.id).first
		if @manager
			@product = Product.new(product_params)
			@product.save

			render json: @product, status: :ok
		else
			render json: { 'message':"You don't have permission to create new product..."}
		end
	end

	def show
		@product = Product.where(id: params[:id]).first
		if @product
			render json: @product, status: :ok
		else
			render json: { 'message':"There is no such product with id #{params[:id]}..."}
		end
	end

	def destroy
		@manager = ProductManager.where(user_id: @current_user.id).first
		if @manager
			@product = Product.where(id: params[:id]).first
			if @product
				@product.destroy

				render json: { 'message':"Successfully deleted the product with id #{params[:id]}..."}
			else
				render json: { 'message':"There is no such product with id #{params[:id]}..."}
			end
		else
			render json: { 'message':"You don't have permission to delete product..."}
		end
	end
	
	def setprice
		@manager = SalesManager.where(user_id: @current_user.id).first
		if @manager
			@product = Product.where(id: params[:id]).first

			if @product
				@product.update(price: product_params[:price], discount: product_params[:discount])

				render json: @product, status: :ok
			else
				render json: { 'message':"There is no such product with id #{params[:id]}..."}
			end
		else
			render json: { 'message':"You don't have permission to set price..."}
		end
	end

	def setquantity
		@manager = ProductManager.where(user_id: @current_user.id).first
		if @manager
			@product = Product.where(id: params[:id]).first

			if @product
				@product.update(stock_quantity: product_params[:stock_quantity])
				
				render json: @product, status: :ok
			else
				render json: { 'message':"There is no such product with id #{params[:id]}..."}
			end
		else
			render json: { 'message':"You don't have permission to set quantity..."}
		end
	end
		
	private

	def product_params
		params.require(:product).permit(:name, :description,
										:dist_info, :warranty_status,
										:model_number, :stock_quantity,
										:price, :discount, :categories)
	end
end

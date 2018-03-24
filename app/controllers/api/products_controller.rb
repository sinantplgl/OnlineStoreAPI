class Api::ProductsController < ApplicationController
	skip_before_action :authenticate_request, :only => [:index, :show]
	before_action :check_product_manager, :only => [:create, :destroy, :setquantity]
	before_action :check_sales_manager, :only => [:setdiscount, :setprice]
	def index
		@products = Product.all

		render json: @products, status: :ok
	end

	def show
		@product = Product.where(id: params[:id]).first
		if @product
			render json: @product, status: :ok
		else
			render json: { 'message':"There is no such product with id #{params[:id]}..."}
		end
	end
# => ONLY THE PRODUCT MANAGER ADD/DELETE PRODUCT OR UPDATE STOCK INFORMATION
	def create
		@product = Product.new(product_params.except(:price, :discount))
		@product.save

		render json: @product, status: :ok
	end

	def destroy
		@product = Product.where(id: params[:id]).first
		if @product
			@product.destroy

			render json: { 'message':"Successfully deleted the product with id #{params[:id]}..."}
		else
			render json: { 'message':"There is no such product with id #{params[:id]}..."}
		end
	end
	
	def setquantity
		@product = Product.where(id: params[:id]).first

		if @product
			@product.update(stock_quantity: product_params[:stock_quantity])
			
			render json: @product, status: :ok
		else
			render json: { 'message':"There is no such product with id #{params[:id]}..."}
		end
	end
# => ONLY SALES MANAGER SET PRICE OR DISCOUNT	
	def setprice
		@product = Product.where(id: params[:id]).first

		if @product
			@product.update(price: product_params[:price])

			render json: @product, status: :ok
		else
			render json: { 'message':"There is no such product with id #{params[:id]}..."}
		end
	end
		
	def setdiscount
		@product = Product.where(id: params[:id]).first

		if @product
			@product.update(discount: product_params[:discount])

			render json: @product, status: :ok
		else
			render json: { 'message':"There is no such product with id #{params[:id]}..."}
		end
	end

	private

	def product_params
		params.require(:product).permit(:name, :description,
										:dist_info, :warranty_status,
										:model_number, :stock_quantity,
										:price, :discount, :categories)
	end

	def check_product_manager
		@manager = ProductManager.where(user_id: @current_user.id).first
		if @manager.nil?
			render json: { 'message':"You don't have permission to do this..."}
		end
	end

	def check_sales_manager
		@manager = SalesManager.where(user_id: @current_user.id).first
		if @manager.nil?
			render json: { 'message':"You don't have permission to do this..."}
		end
	end
end

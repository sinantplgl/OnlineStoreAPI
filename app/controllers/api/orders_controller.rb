class Api::OrdersController < ApplicationController
	def index
		@orders = Order.where(customer_id: @current_user.id)
		render json: @orders
	end

	def show
		@order = Order.where(customer_id: @current_user.id, invoice: nil).first

		if @order
			render json: @order
		else
			render json: {message:"There is nothing to show"}
		end
	end

	def update_price
		@order = Order.where(customer_id: @current_user, invoice: nil).first

		if @order
			@order.update(total_price: order_params[:total_price])

			render json: @order
		else
			render json: {message:"There is nothing to update"}
		end
			
	end

	def update_address
		@order = Order.where(customer_id: @current_user, invoice: nil).first

		if @order
			@order.update(delivery_address: order_params[:delivery_address])

			render json: @order
		else
			render json: {message:"There is nothing to update"}
		end
	end

	private

	def order_params
		params.require(:order).permit(:total_price, :delivery_address)
	end
end

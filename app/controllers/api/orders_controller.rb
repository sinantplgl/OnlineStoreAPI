class Api::OrdersController < ApplicationController
	def index
		@orders = Order.where(customer_id: @current_user.id)
		render json: @orders
	end

	def show
		@order = Order.where(customer_id: @current_user.id, invoice_id: nil).first

		if @order
			render json: @order
		else
			render json: {message:"There is nothing to show"}
		end
	end

	def update_address
		@order = Order.where(customer_id: @current_user, invoice_id: nil).first

		if @order
			@order.update(delivery_address: order_params[:delivery_address])

			render json: @order
		else
			render json: {message:"There is nothing to update"}
		end
	end

	def payment
		# find last order
		@order = Order.where(customer_id: @current_user.id, invoice_id: nil).first

		#check if available
		items = []
		@order.delivery_lists.each do |item|
			if item.product.stock_quantity < item.quantity
				items << item
			end
		end
		if items.length != 0
			render json: {message: "Item is not available in stock.", items: items}, status: 409
		else
			if @order
				@order.delivery_lists.each do |item|
					item.product.update(stock_quantity: item.product.stock_quantity - item.quantity)
				end
				@order.invoice = Invoice.new(idate: Time.now)
				@order.update(invoice_id: Invoice.find_by_order_id(@order.id).id)

				render json: @order.invoice, status: :ok
			end
		end
	end

	private

	def order_params
		params.require(:order).permit(:total_price, :delivery_address)
	end
end

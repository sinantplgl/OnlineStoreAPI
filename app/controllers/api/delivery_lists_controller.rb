class Api::DeliveryListsController < ApplicationController
	def create
		@order = nil
		if (not @current_user.customer.orders.last) || @current_user.customer.orders.last.invoice
			@order = @current_user.customer.orders << Order.new(total_price: 0)
		else
			@order = @current_user.customer.orders.last
		end
		
		# add item to the cart
		@cart_item = @order.delivery_lists << DeliveryList.new(delivery_list_params)
		# update total price
		total_price = 0
		@order.delivery_lists.each do |item|
			total_price += (item.product.price * (100 - item.product.discount) / 100 * item.quantity)
		end
		@order.update(total_price: total_price)

		render json: @cart_item, status: :ok
	end

	def update
		# find the item which will be updated
		@cart_item = DeliveryList.where(id: params[:id]).first
		if @cart_item
			# check if item is belongs to current user
			if @cart_item.order.customer_id == @current_user.id
				@cart_item.update(quantity: delivery_list_params[:quantity])
				render json: @cart_item, status: :ok
			else
				render json: { 'message':"You don't have permission to update this item..."}
			end
		else
			render json: { 'message':"There is no cart item with id #{params[:id]}..."}
		end
	end

	def destroy
		# find the item which will be deleted
		@cart_item = DeliveryList.where(id: params[:id]).first
		if @cart_item
			# check if item is belongs to current user
			if @cart_item.order.customer_id == @current_user.id
				@cart_item.destroy
				render json: { 'message':"Item deleted from the cart..." }, status: :ok
			else
				render json: { 'message':"You don't have permission to delete this item..." }
			end
		else
			render json: { 'message':"There is no cart item with id #{params[:id]}..." }
		end
	end

	private

	def delivery_list_params
		params.require(:delivery_list).permit(:product_id, :quantity)
	end	
end

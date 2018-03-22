class Api::DeliveryListsController < ApplicationController
	def create
		@order = nil
		if (not @current_user.customer.orders.last) || @current_user.customer.orders.last.invoice
			@order = Order.create(	customer_id: @current_user.id,
									delivery_address: @current_user.customer.home_address,
									total_price: 0)
		else
			@order = @current_user.customer.orders.last
		end
		
		@cart_item = DeliveryList.create(order_id: @order.id,
								product_id: delivery_list_params[:product_id],
								quantity: delivery_list_params[:quantity])
			render json:	{
								status: 200, 
								cart_item: {
									id: @cart_item.id,
									product: Product.find(@cart_item.product_id),
									quantity: @cart_item.quantity
								}
							}, status: :ok
	end

	def update
		@cart_item = DeliveryList.where(id: params[:id]).first
		if @cart_item
			if Order.find(@cart_item.order_id).customer_id == @current_user.id
				@cart_item.update(quantity: delivery_list_params[:quantity])
				render json:	{
								status: 200, 
								cart_item: {
									id: @cart_item.id,
									product: Product.find(@cart_item.product_id),
									quantity: @cart_item.quantity
								}
							}, status: :ok
			else
				render json: { 'message':"You don't have permission to update this item..."}
			end
		else
			render json: { 'message':"There is no cart item with id #{params[:id]}..."}
		end
	end

	def destroy
		@cart_item = DeliveryList.where(id: params[:id]).first
		if @cart_item
			if Order.find(@cart_item.order_id).customer_id == @current_user.id
				@cart_item.destroy
				render json: { 'message':"Item deleted from the cart..."}
			else
				render json: { 'message':"You don't have permission to delete this item..."}
			end
		else
			render json: { 'message':"There is no cart item with id #{params[:id]}..."}
		end
	end

	private

	def delivery_list_params
		params.require(:delivery_list).permit(:product_id, :quantity)
	end	
end

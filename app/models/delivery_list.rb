class DeliveryList < ApplicationRecord
	belongs_to :product
	belongs_to :order

	def as_json(options={})
		super(
			only: [:id, :quantity, :is_delivered],
			include: [:product]
			)
	end
end

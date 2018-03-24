class Order < ApplicationRecord
	belongs_to :customer
	has_many :delivery_lists
	has_many :products, through: :delivery_lists
	has_one :invoice

	def as_json(options={})
		super(
			only: [:id, :delivery_address, :total_price],
			include: [:invoice],
			methods: [:customer_info, :items]
			)
	end

	def customer_info
		User.find(self.customer.id)
	end

	def items
		self.delivery_lists
	end
end

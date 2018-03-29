class User < ApplicationRecord
	has_secure_password
	has_one :customer
	has_one :sales_manager
	has_one :product_manager

	def as_json(options={})
		super(
			only: [:id, :name, :email],
			methods: [:home_address, :tax_id]
			)
	end

	def home_address
		self.customer.home_address
	end

	def tax_id
		self.customer.tax_id
	end
end

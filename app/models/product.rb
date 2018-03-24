class Product < ApplicationRecord
	has_many :product_categories
	has_many :categories, through: :product_categories
	has_many :delivery_lists
	has_many :orders, through: :delivery_lists

	def as_json(options={})
		super(
			include: [:categories]
			)
	end
end

class Product < ApplicationRecord
	has_many :categories, through: :product_categories
	has_many :orders, through: :delivery_lists
end

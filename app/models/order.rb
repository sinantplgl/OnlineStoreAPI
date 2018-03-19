class Order < ApplicationRecord
	belongs_to :customer
	has_many :products, through: :delivery_lists
	has_one :invoice
end

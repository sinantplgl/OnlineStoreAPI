class User < ApplicationRecord
	has_secure_password
	has_one :customer
	has_one :sales_manager
	has_one :product_manager
end

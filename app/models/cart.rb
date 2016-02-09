class Cart
	attr_reader :items

	def initialize(items)
		@items = items ? items : []
	end

	def add_item_to_cart(product_name, product_id, product_price, product_quantity)
		product_quantity = product_quantity ? product_quantity.first.to_i : 1

		item = item_from_shopping_cart(product_id)
		if item
			item["quantity"] = product_quantity
		else
			@items << { "quantity" => product_quantity,
						"name" => product_name,
						"id" => product_id,
						"price" => product_price }
		end
	end

	def total
		@items.inject(0) do |sum, item|
			sum += item["price"].to_f*item["quantity"]
		end
	end

	private

	def item_from_shopping_cart(product_id)
		@items.find do |item|
			item["id"] == product_id
		end
	end

end
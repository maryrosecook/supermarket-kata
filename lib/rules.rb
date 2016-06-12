require "base_price_rule"
require "multiple_item_discount_rule"

module Supermarket
  RULES = {
    "A" => MultipleItemDiscountRule.new({base_price: 50,
                                         discount_count: 3,
                                         discount_price: 130}),
    "B" => MultipleItemDiscountRule.new({base_price: 30,
                                         discount_count: 2,
                                         discount_price: 45}),
    "C" => BasePriceRule.new(20),
    "D" => BasePriceRule.new(15)
  }
end

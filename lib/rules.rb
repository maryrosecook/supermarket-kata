require "base_price_rule"
require "multiple_item_discount_rule"

module Supermarket
  RULES = {
    "A" => MultipleItemDiscountRule.new(50, 3, 130),
    "B" => MultipleItemDiscountRule.new(30, 2, 45),
    "C" => BasePriceRule.new(20),
    "D" => BasePriceRule.new(15)
  }
end

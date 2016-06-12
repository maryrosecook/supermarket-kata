module Supermarket
  class MultipleItemDiscountRule
    private

    attr_reader :base_price, :discount_count, :discount_price

    public

    def initialize(price_data)
      @base_price = price_data[:base_price]
      @discount_count = price_data[:discount_count]
      @discount_price = price_data[:discount_price]
    end

    def total(count)
      multiple_discount_component(count) + base_price_component(count)
    end

    private

    def multiple_discount_component(count)
      count / discount_count * discount_price
    end

    def base_price_component(count)
      (count % discount_count) * base_price
    end
  end
end

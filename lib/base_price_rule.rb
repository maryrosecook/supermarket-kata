module Supermarket
  class BasePriceRule
    private

    attr_reader :base_price

    public

    def initialize(base_price)
      @base_price = base_price
    end

    def total(count)
      base_price
    end
  end
end

# http://codekata.com/kata/kata09-back-to-the-checkout/

module Supermarket
  class CheckOut
    private

    attr_reader :rules, :buckets

    public

    def initialize(rules, buckets)
      @rules = rules
      @buckets = buckets
    end

    def scan(item)
      buckets.scan(item)
    end

    def total
      buckets
        .counts
        .map { |count| rules[count.item].total(count.count) }
        .inject(0, :+)
    end
  end
end

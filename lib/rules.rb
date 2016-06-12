require "rule"

module Supermarket
  RULES = {
    "A" => Rule.new(50, Proc.new { |base, count|
                      discount_count = 3
                      count / discount_count * 130 + (count % discount_count) * base
                    }),

    "B" => Rule.new(30, Proc.new { |base, count|
                      discount_count = 2
                      count / discount_count * 45 + (count % discount_count) * base
                    }),

    "C" => Rule.new(20),
    "D" => Rule.new(15)
  }
end

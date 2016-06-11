module Supermarket
  class Buckets
    private

    attr_reader :buckets

    public

    def initialize
      @buckets = {}
    end

    Count = Struct.new(:item, :count)
    def counts
      buckets.map { |item, count| Count.new(item, count) }
    end

    def scan(item)
      buckets[item] ||= 0
      buckets[item] += 1
    end
  end
end

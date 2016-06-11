require 'rule'

describe Supermarket::Rule do
  describe "total" do
    it "should return base price for single item without special calculator" do
      rule = described_class.new(10)
      expect(rule.total(1)).to eq(10)
    end

    it "should return calculated price for single item with special calculator" do
      calculator = Proc.new { |base_price, count| count / 2 * base_price }
      rule = described_class.new(10, calculator)
      expect(rule.total(2)).to eq(10)
    end
  end
end

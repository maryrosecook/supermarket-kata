require 'base_price_rule'

describe Supermarket::BasePriceRule do
  describe "total" do
    it "should return base price for single item without special calculator" do
      rule = described_class.new(10)
      expect(rule.total(1)).to eq(10)
    end
  end
end

require "multiple_item_discount_rule"

describe Supermarket::MultipleItemDiscountRule do
  describe "total" do
    it "should return calculated price for single item with special calculator" do
      rule = described_class.new(10, 2, 10)
      expect(rule.total(2)).to eq(10)
    end
  end
end

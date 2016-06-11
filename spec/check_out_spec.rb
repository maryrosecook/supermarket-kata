require "check_out"
require "buckets"
require "rules"

describe Supermarket::CheckOut do
  describe "scan" do
    it "should tell buckets to scan the passed item" do
      item = "A"

      buckets = Supermarket::Buckets.new
      expect(buckets).to receive(:scan).with(item)

      subject = Supermarket::CheckOut.new({}, buckets)
      subject.scan(item)
    end
  end

  describe "total" do
    let(:subject) { Supermarket::CheckOut.new(RULES, Supermarket::Buckets.new) }

    it "should get zero for zero items" do
      expect(subject.total).to eq(0)
    end

    it "should return base price for a single item" do
      subject.scan("A")
      expect(subject.total).to eq(50)
    end

    it "should total base prices for several single items" do
      subject.scan("A")
      subject.scan("B")
      subject.scan("C")
      subject.scan("D")
      expect(subject.total).to eq(115)
    end
  end
end

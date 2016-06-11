require "check_out"
require "buckets"

describe Supermarket::CheckOut do
  describe "acceptance criteria" do
    let(:subject) { Supermarket::CheckOut.new(RULES, Supermarket::Buckets.new) }

    def price(items_str)
      items_str.split("").each { |item| subject.scan(item) }
      subject.total
    end

    it "should give correct total at end of scanning" do
      expect(price("")).to eq(0)
      expect(price("A")).to eq(50)
      expect(price("AB")).to eq(80)
      expect(price("CDBA")).to eq(115)

      expect(price("AA")).to eq(100)
      expect(price("AAA")).to eq(130)
      expect(price("AAAA")).to eq(180)
      expect(price("AAAAA")).to eq(230)
      expect(price("AAAAAA")).to eq(260)

      expect(price("AAAB")).to eq(160)
      expect(price("AAABB")).to eq(175)
      expect(price("AAABBD")).to eq(190)
      expect(price("DABABA")).to eq(190)
    end

    it "should total incrementally" do
      expect(subject.total).to eq(0)

      subject.scan("A");
      expect(subject.total).to eq(50)

      subject.scan("B");
      expect(subject.total).to eq(80)

      subject.scan("A");
      expect(subject.total).to eq(130)

      subject.scan("A");
      expect(subject.total).to eq(160)

      subject.scan("B");
      expect(subject.total).to eq(175)
    end
  end
end

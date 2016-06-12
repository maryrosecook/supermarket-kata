require "check_out"
require "buckets"
require "rules"

describe Supermarket::CheckOut do
  describe "acceptance criteria" do
    let(:subject) {
      Supermarket::CheckOut.new(Supermarket::RULES,
                                Supermarket::Buckets.new)
    }

    def price(items_str)
      items_str.split("").each { |item| subject.scan(item) }
      subject.total
    end

    it "should total empty basket to 0" do
      expect(price("")).to eq(0)
    end

    it "should price single item at base price" do
      expect(price("A")).to eq(50)
    end

    it "should price two single items at sum of their base prices" do
      expect(price("AB")).to eq(80)
    end

    it "should price four single items at sum of their base prices" do
      expect(price("CDBA")).to eq(115)
    end

    it "should price two of same item at two times base price" do
      expect(price("AA")).to eq(100)
    end

    it "should price 3 3fer items at discount price" do
      expect(price("AAA")).to eq(130)
    end

    it "should price 4 3fer items at discount price plus base" do
      expect(price("AAAA")).to eq(180)
    end

    it "should price 5 3fer items at discount price plus two bases" do
      expect(price("AAAAA")).to eq(230)
    end

    it "should price 6 3fer items at discount price times two" do
      expect(price("AAAAAA")).to eq(260)
    end

    it "should price 3 3fer items and one other item at discount plus other base" do
      expect(price("AAAB")).to eq(160)
    end

    it "should price 3 3fer items and two 2fer item at sum of discount prices" do
      expect(price("AAABB")).to eq(175)
    end

    it "should price 3 3fer items, two 2fer items and one other item
        at sum of 3fer discount, 2fer discount, other item base" do
      expect(price("AAABBD")).to eq(190)
    end

    it "should price 3 3fer items, two 2fer items and one other item
        at sum of 3fer discount, 2fer discount, other item base even
        when same items not scanned in groups" do
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

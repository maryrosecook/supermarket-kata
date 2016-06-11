require 'buckets'

describe Supermarket::Buckets do
  let(:subject) { Supermarket::Buckets.new }

  describe "counting" do
    it "should return no counts after buckets initialized" do
      expect(subject.counts).to eq([])
    end

    it "should return a count of 1 for single item and 2 for two other items" do
      item1 = "A"
      item2 = "B"
      subject.scan(item1)
      subject.scan(item1)
      subject.scan(item2)

      expect(subject.counts.length).to eq(2)
      expect(subject.counts[0].count).to eq(2)
      expect(subject.counts[1].count).to eq(1)
    end
  end
end

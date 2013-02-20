require "spec_helper"

describe Charosc::Text do
  let(:text) { described_class.new("abc defA ghijB") }

  describe "#chars" do
  end

  describe "#words" do
    it "returns string split on whitespace" do
      text.words.should == ["abc", "defA", "ghijB"]
    end
  end

  describe "#chars" do
    it "returns array of chars" do
      text.chars.should == [
        "a", "b", "c", " ", "d", "e", "f", "A", " ", "g", "h", "i", "j", "B"
      ]
    end
  end
end

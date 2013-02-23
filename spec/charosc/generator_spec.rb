require "spec_helper"

describe Charosc::Generator do
  let(:generator) { described_class.new("This is a test.") }

  describe "#generate" do
    it "returns a string of num_chars length" do
      gen = generator.generate(100)
      gen.size.should == 100
    end
  end
end

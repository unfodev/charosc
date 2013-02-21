require "spec_helper"

describe Charosc::Oscillator do
  describe "#next" do
    context "1, top: 5, bottom: 1, inc: 1" do
      let(:osc) { described_class.new(1, top: 5, bottom: 1, inc: 1) }

      it "steps through values" do
        [2, 3, 4, 5, 4, 3, 2, 1, 2, 3].each_with_index do |val, ndx|
          osc.next.should == val
        end
      end
    end

    context "33, top: 5, bottom: 1, inc: 1" do
      let(:osc) { described_class.new(33, top: 5, bottom: 1, inc: 1) }

      it "steps through values" do
        [4, 3, 2, 1, 2, 3, 4, 5, 4, 3, 2].each_with_index do |val, ndx|
          osc.next.should == val
        end
      end
    end

    context "1, top: 10, bottom: 3, inc: 0.2" do
      let(:osc) { described_class.new(1, top: 10, bottom: 3, inc: 0.2) }

      it "steps through values" do
        [3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6].each_with_index do |val, ndx|
          osc.next.should == val
        end
      end
    end
  end
end

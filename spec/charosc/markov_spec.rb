require "spec_helper"

describe Charosc::Markov do
  let(:chars)  { "abcabcdabcdeabcdefabcdefg".scan(/./) }
  let(:markov) { described_class.new(chars) }

  describe "#get_sequence" do
    it "raises if depth is > 1" do
      expect { markov.get_sequence("a", 0) }.to raise_error(ArgumentError)
    end

    describe "get a possible sequence after start_obj" do
      context "start_obj 'a', depth 3" do
        let(:a3) { markov.get_sequence("a", 3) }
        let(:f5) { markov.get_sequence("f", 5) }

        specify { [%w{b c a}, %w{b c d}].should include(a3) }
        specify { [%w{a b c d e}, ["g"]].should include(f5) }
      end
    end
  end
end

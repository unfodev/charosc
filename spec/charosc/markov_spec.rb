require "spec_helper"

describe Charosc::Markov do
  let(:chars)  { "abcabcdabcdeabcdefabcdefg".scan(/./) }
  let(:markov) { described_class.new(chars) }

  describe "#get_sequence" do
    it "raises if depth is > 1" do
      expect { markov.get_sequence("a", 0) }.to raise_error(ArgumentError)
    end

    describe "get a possible sequence after start_obj" do
      let(:a2) { markov.get_sequence("a", 2) }
      let(:a3) { markov.get_sequence("a", 3) }
      let(:b3) { markov.get_sequence("b", 3) }
      let(:f5) { markov.get_sequence("f", 5) }
      let(:g6) { markov.get_sequence("g", 6) }

      20.times do
        specify { [%w{b c}].should include(a2) }
        specify { [%w{b c a}, %w{b c d}].should include(a3) }
        specify { [%w{c a b}, %w{c d a}, %w{c d e}].should include(b3) }
        specify { [%w{a b c d e}, %w{g a b c a}].should include(f5) }
        specify { [%w{a b c a b c}].should include(g6) }
      end
    end
  end
end

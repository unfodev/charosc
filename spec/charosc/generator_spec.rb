require "spec_helper"

module Charosc
  describe Generator do
    let(:generator) { described_class.new("This is a test.") }

    describe "default settings" do
      subject { generator }

      its(:oscil)       { should be_an(Oscillator) }
      its(:depth)       { should == 3 }
      its(:mod_enabled) { should be_true }
      its(:mod_inc)     { should == 1 }
      its(:mod_top)     { should == 300 }
      its(:mod_bottom)  { should == 2 }

      describe "Oscillator setup" do
        subject { generator.oscil.options }

        its([:top])    { should == 300 }
        its([:bottom]) { should == 2 }
        its([:inc])    { should == 1 }
      end
    end

    describe "#generate" do
      subject { generator }

      it "returns a string of num_chars length" do
        [100, 3000, 2].each do |n|
          subject.generate(n).size.should == n
        end
      end

      context "modulation enabled" do
        before { subject.mod_enabled = true }

        describe "#next_depth" do
          it "gets depth from self" do
            subject.oscil.should_receive(:next)
            subject.send(:next_depth)
          end
        end
      end

      context "modulation not enabled" do
        before { subject.mod_enabled = false }

        describe "#next_depth" do
          it "gets depth from Oscillator" do
            subject.should_receive(:depth)
            subject.send(:next_depth)
          end
        end
      end
    end
  end
end

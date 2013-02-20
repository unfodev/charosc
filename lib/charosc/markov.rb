module Charosc
  class Markov
    attr_reader :db, :set

    # set - Array of objects
    def initialize(set)
      @db = {}
    end

    # Public: Get a Markov-weighted random selection from possible sequences
    #         after start_obj in @set. Memoizes randomizers on @db
    #
    def get_sequence(start_obj, depth)
      unless depth > 1 raise ArgumentError, "depth must be a number > 1"

      (@db[start_obj][depth] ||= build_randomizer(start_obj, depth)).sample
    end

    private

    # Private: Build a WeightedRandomizer based on a set (Array)
    #
    # ndx_obj - The object we're looking for
    # depth   - Length of sequence after ndx_obj
    #
    # Returns WeightedRandomizer
    def build_randomizer(ndx_obj, depth)
      weights = {}.tap do |w|
        set.each_with_index do |obj, ndx|
          if obj == ndx_obj
            sequence    = set[(ndx + 1)..(ndx + depth)]
            w[sequence] = w.has_key?(sequence) ? w[sequence] + 1 : 1
          end
        end
      end

      WeightedRandomizer.new(weights)
    end
  end
end

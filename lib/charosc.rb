require "charosc/version"

module Charosc
  # Your code goes here...
end


def build_randomizer(ndx_obj, depth)
  weights = {}.tap do |w|
    set.each_with_index do |obj, ndx|
      if obj == ndx_obj
        sequence = set[(ndx + 1)..(ndx + depth)]

        if w.has_key?(sequence)
          w[sequence] += 1
        else
          w[sequence] = 1
        end
      end
    end
  end

  WeightedRandomizer.new(weights)
end


"a" => {
  1 => build_randomizer("a", 1)
  2 => build_randomizer("a", 2)
  3 => build_randomizer("a", 3)
  ...
},
"b" => ...,
...

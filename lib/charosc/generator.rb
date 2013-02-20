module Charosc
  class Generator
    # str - input String
    def initialize(str)
      @chars  = Text.new(str).chars
      @markov = Markov.new(@chars)
    end

    # Public: Generate text
    #
    # num_chars - Number of characters to generate
    # depth     - after-sequence length
    #
    # Returns String
    def generate(num_chars, depth)
      output = rand_char

      until output.size > num_chars
        output += @markov.get_sequence(output[-1], depth).join("")
      end

      output[0..(num_chars - 1)]
    end

    private

    # Private: Get a random character
    #
    # Returns String
    def rand_char
      @chars.sample
    end
  end
end

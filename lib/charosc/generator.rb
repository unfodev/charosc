module Charosc
  class Generator
    attr_reader :chars
    attr_accessor :oscil, :depth, :mod_enabled, :mod_inc,
                  :mod_top, :mod_bottom

    # str - input String
    def initialize(str, options = {})
      @chars  = Text.new(str).chars
      @markov = Markov.new(@chars)

      @options     = default_options.merge(options)
      @depth       = @options[:depth]
      @mod_enabled = @options[:mod_enabled]
      @mod_inc     = @options[:mod_inc]
      @mod_top     = @options[:mod_top]
      @mod_bottom  = @options[:mod_bottom]

      @oscil = Oscillator.new(
        depth,
        top:    mod_top,
        bottom: mod_bottom,
        inc:    mod_inc
      )
    end

    # Public: Generate text
    #
    # num_chars - Number of characters to generate
    # block     - Yields to block after output is concatenated
    #
    # Returns String
    def generate(num_chars, &block)
      output = rand_char

      until output.size > num_chars
        seq = @markov.get_sequence(output[-1], next_depth)
        output += seq.join("")

        yield seq if block_given?
      end

      format_text(output[0..(num_chars - 1)])
    end

    private

    # Private: Text filter
    #
    # Returns String
    def format_text(input)
      input.gsub(/\r/, "\n")
    end

    # Private: Get a random character
    #
    # Returns String
    def rand_char
      @chars.sample
    end

    def next_depth
      mod_enabled ? oscil.next : depth
    end

    def default_options
      { mod_enabled: true,
        depth:       3,
        mod_inc:     1,
        mod_top:     300,
        mod_bottom:  2,
      }
    end
  end
end

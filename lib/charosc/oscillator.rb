module Charosc
  class Oscillator
    attr_reader :options, :value

    def initialize(value, options = {})
      @value     = value
      @options   = default_options.merge(options)
      @direction = :up
    end

    # Public: Get the next value
    #
    # Returns Integer
    def next
      if at_top?
        @direction = :down
      elsif at_bottom?
        @direction = :up
      end

      go_up if going_up?
      go_down if going_down?

      value.round
    end

    private

    def default_options
      { top:    1000,
        bottom: 1,
        inc:    1
      }
    end

    def at_top?
      if value >= options[:top]
        !!@value = options[:top]
      end
    end

    def at_bottom?
      if value <= options[:bottom]
        !!@value = options[:bottom]
      end
    end

    def going_up?
      @direction == :up
    end

    def going_down?
      @direction == :down
    end

    def go_down
      @value -= options[:inc]
    end

    def go_up
      @value += options[:inc]
    end
  end
end

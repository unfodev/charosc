module Charosc
  class Generator
    attr_reader :words

    def initialize(str)
      @str = str
    end

    def char_split
      str.scan(/./) 
    end

    def uniq_chars
      char_split.uniq
    end

    def generate(num_chars)
    end
  end
end

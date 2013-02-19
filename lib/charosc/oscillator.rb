module Charosc
  class Oscillator
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


class Array
  def indexes_of(obj)
    [].tap do |out|
      self.each_with_index do |o, ndx|
        out << ndx if o == obj
      end
    end

    #inject([]) do |acc, el|
    #  acc << find_index(el) if el == obj
    #  acc
    #end
  end
end


p [1, 2, 3, 4, 6, 6, 7, 8, 5, 6, 4, 3,3 ].indexes_of(5)

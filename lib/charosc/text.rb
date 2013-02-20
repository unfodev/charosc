module Charosc
  class Text
    attr_reader :str

    # str - String input
    def initialize(str)
      @str = str
    end

    def chars
      @chars ||= str.scan(/./)
    end

    def words
      @words ||= str.split(/\s+/)
    end
  end
end

module Scrmbale
  class Word
    attr_reader :text
    attr_accessor :discovered
    alias :discovered? :discovered

    def initialize(text)
      @text = text
      @discovered = false
    end

    def length
      text.length
    end
  end
end

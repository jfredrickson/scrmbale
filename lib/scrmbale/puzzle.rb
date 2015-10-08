require 'scrmbale/word'

module Scrmbale
  class Puzzle
    attr_reader :key, :letters, :words

    def initialize(key, word_list)
      @letters = @key = key
      @words = []
      word_list.each do |w|
        @words.push Word.new(w)
      end
      shuffle
    end

    def guess(word)
      word.upcase!
      undiscovered_words.each do |u|
        if (u.text == word)
          u.discovered = true
          return true
        end
      end
      return false
    end

    def discovered_words
      @words.select { |w| w.discovered? }
    end

    def undiscovered_words
      @words.select { |w| !w.discovered? }
    end

    def shuffle
      @letters = @letters.split("").shuffle.join
    end

    def complete?
      undiscovered_words.empty?
    end

    def big_word_complete?
      discovered_words.select { |w| w.length == 6 }.any?
    end
  end
end

require 'json'
require 'scrmbale/puzzle'

module Scrmbale
  class Game
    attr_reader :score, :round

    def initialize(puzzles_json)
      @score = 0
      @round = 0
      @puzzles = []
      JSON.parse(puzzles_json).each do |p|
        @puzzles.push Puzzle.new(p["letters"], p["words"])
      end
      next_round
    end

    def next_round
      if @round == 0 || big_word_complete?
        @round += 1
        @current_puzzle = @puzzles[rand(@puzzles.count)]
        @puzzles.delete(@current_puzzle)
      end
    end

    def guess(word)
      if @current_puzzle.guess(word)
        @score += word.length * 100
      end
    end

    def letters
      @current_puzzle.letters
    end

    def shuffle
      @current_puzzle.shuffle
    end

    def words
      @current_puzzle.words
    end

    def complete?
      @current_puzzle.complete?
    end

    def big_word_complete?
      @current_puzzle.big_word_complete?
    end
  end
end

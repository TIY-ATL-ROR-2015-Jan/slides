require 'set'

class Hangman
  attr_reader :turns, :guesses

  def initialize(word)
    @turns = 6
    @guesses = Set.new
    @answer = word
  end

  def guessed_all_letters?
    @answer.chars.all? do |letter|
      self.guesses.include?(letter)
    end
  end

  def finished?
    self.turns.zero? || self.guessed_all_letters?
  end
end

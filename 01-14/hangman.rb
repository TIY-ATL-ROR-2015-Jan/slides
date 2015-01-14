require 'set'
require 'pry'

class Hangman
  def initialize(wordlist, turns)
    @turn_count = turns
    @answer = wordlist.sample
    @guesses = Set.new
  end

  def get_letter
    puts "Guess a letter!"
    result = gets.chomp
    until result =~ /^[a-z]$/
      puts "I said one letter dummy."
      result = gets.chomp
    end
    result
  end

  def take_turn
    puts "current state of game"
    letter = get_letter
    @guesses.add(letter)
    ## figure out if turn count goes down
    ## display updated game state
    ## game over if they got it
  end

  def to_s
    ## something fancy that prints
    ## the board and guesses
  end
end

binding.pry

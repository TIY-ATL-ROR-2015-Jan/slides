## BEWARE THE SEMICOLON!

require 'pry'
require 'set'

words = ['angus',
         'onomatopeia',
         'mississippi',
         'cookies',
         'terminal',
         'illness',
         'communist',
         'dictator',
         'capitalist',
         'marxist',
         'darwinism']

def take_turn
  ## TODO: Write me!
  # decrement turn if letter not in answer
  # get user input / show some status
  # add input to set of guessed letters
  puts 'we are taking a turn'
end

def finished? (turns, guesses, answer)
  turns.zero? || answer.chars.all? { |l| guesses.include?(l) }
end

def main(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  until finished?(turn_count, guessed, answer)
    take_turn
  end
end

main(words)

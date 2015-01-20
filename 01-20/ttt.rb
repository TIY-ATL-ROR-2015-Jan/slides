class TicTacToe
  attr_reader :draw?
  attr_accessor :players

  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
          [0, 3, 6], [1, 4, 7], [2, 5, 8],
          [0, 4, 8], [2, 4, 6]]

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turns = 9
    @board = (1..9).to_a
    @next_player = player1
  end

  def show_board
    puts "\n
     #{@board[0]} | #{@board[1]} | #{@board[2]}
    ------------
     #{@board[3]} | #{@board[4]} | #{@board[5]}
    ------------
     #{@board[6]} | #{@board[7]} | #{@board[8]}
  \n"
  end

  def finished?
    draw? || winner?
  end

  def draw?
    @turns.zero?
  end

  def winner?
    WINS.any? do |i, j, k|
      if @board[i] == @board[j] && @board[j] == @board[k]
        return @board[i]
      end
    end
  end

  def pick_square
    move = @next_player.choose_move(@board) - 1
    @board[move] = @next_player.name
    puts "#{@next_player} moved to #{move}."
  end

  def take_turn
    puts "It is #{@next_player}'s turn."
    show_board
    pick_square
    @next_player = @player1 == @next_player ? @player2 : @player1
    @turns -= 1
  end
end

class Player
  attr_reader :name

  def initialize(name: nil)
    @name = name.nil? ? :CPU : name
  end

  def choose_move(board)
    available = board.select { |x| x.is_a? Fixnum }
    if @name == :CPU
      available.sample
    else
      move = prompt_user("Player #{self.name}: Please choose a space ...",
                         /^[#{available.join}]$/, 'You must choose an available space!')
      move.to_i
    end
  end

  def prompt_user(prompt, validator, error_msg, clear_screen: nil)
    `clear` if clear_screen
    puts "\n#{prompt}\n"
    result = gets.chomp
    until result =~ validator
      puts "\n#{error_msg}\n"
      result = gets.chomp
    end
    puts
    result
  end

  def to_s
    self.name
  end
end

player1 = Player.new name: "brit"
player2 = Player.new

game = TicTacToe.new(player1, player2)

# This could be a game.play method, really ...
puts "Tic Tac Toe has begun!"
until game.finished?
  game.take_turn
end
game.show_board
puts "The Game is over! Umm ... who won? o_O"

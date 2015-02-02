require 'pry'

board = (1..9).to_a
WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

def greeting
  puts "\n\n   Welcome to Tic-Tac-Toe!\n\n"
  puts "You've never tic'd or tac'd like this before.\n\n"
end

# NOTE: You can define choose_mode before prompt_user as long as you don't
# *call* choose_mode before you define prompt_user.
def choose_mode
  mode = prompt_user("Would you like to play against a human (1) of a computer (2)?",
                     /^[12]$/, "Please choose option 1 (human) or option 2 (computer).")
  mode.to_i == 1 ? :human : :computer
end

def prompt_user(prompt, validator, error_msg)
  `clear`
  puts "\n#{prompt}\n"
  result = gets.chomp
  until result =~ validator
    puts "\n#{error_msg}\n"
    result = gets.chomp
  end
  puts
  result
end

def choose_character
  result =  prompt_user("Player 1: Would you like to play as 'X' or 'O'?",
                        /^[xo]$/i, "You dummy. You can only pick 'X' or 'O'! Pick again.")
  result.upcase!
  puts "\nYou picked #{result}\n"
  result
end

def show_board(board)
  puts "\n
     #{board[0]} | #{board[1]} | #{board[2]}
    ------------
     #{board[3]} | #{board[4]} | #{board[5]}
    ------------
     #{board[6]} | #{board[7]} | #{board[8]}
  \n"
end

def winner?(board)
  WINS.any? do |i, j, k|
    # w.map { |x| board[x] }.uniq.length == 1
    # board[w[0]] == board[w[1]] == board[w[0]]
    binding.pry

    if board[i] == board[j] && board[j] == board[k]
      return board[i]
    end
  end
end

def finished?(board)
  winner?(board) || board.all? { |x| x.is_a? String }
end

def game_over(board)
  victor = winner?(board)
  if victor
    puts "\n\nThe game is over. Player #{victor} won!\n\n"
  else
    puts "\n\nThe game is over. It's a draw!\n\n"
  end
end

def take_turn(board, player)
  show_board(board)
  available = board.select { |x| x.is_a? Fixnum }
  result = prompt_user("Player #{player}: Please choose a space ...",
                       /^[#{available.join}]$/,
                       "You have to choose an available space!")
  result.to_i - 1
end

# TODO: Refactor?
def play_computer(board, player1, player2)
  turn_count = 1
  until finished?(board)
    player = turn_count.odd? ? player1 : player2
    if player == player1
      square = take_turn(board, player)
    else
      square = board.select { |x| x.is_a? Fixnum }.sample - 1
    end
    board[square] = player
    turn_count += 1
  end
end

def play_human(board, player1, player2)
  turn_count = 1
  until finished?(board)
    player = turn_count.odd? ? player1 : player2
    square = take_turn(board, player)
    board[square] = player
    turn_count += 1
  end
end

def tic_tac_toe(board)
  player1 = choose_character
  player2 = player1 == 'X' ? 'O' : 'X'

  greeting
  if choose_mode == :human
    play_human(board, player1, player2)
  else
    play_computer(board, player1, player2)
  end
  game_over(board)
end

#tic_tac_toe(board)
binding.pry

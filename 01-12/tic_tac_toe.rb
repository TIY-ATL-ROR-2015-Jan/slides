require 'pry'

# TODO:
# Support AI player

=begin Brit's bad idea
def print_row(board, row)
  start = 3 * row
  3.times do |col|
    print "#{board[start + col]} "
  end
  puts
end

def show_board2(board)
  3.times do |row|
    print_row(board, row)
  end
end
=end

board = (1..9).to_a
WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

def greeting
  puts "\n\n   Welcome to Tic-Tac-Toe!\n\n"
  puts "You've never tic'd or tac'd like this before.\n\n"
end

# TODO: Refactor user input handling?
def choose_mode
  puts "\n\nWould you like to play against a human (1) or a computer (2)?\n\n"
  result = gets.chomp
  until result =~ /^[1-2]$/
    puts "Please choose option 1 or option 2."
    result = gets.chomp
  end
  result.to_i == 1 ? :human : :computer
end

def choose_character
  puts "\nPlayer 1: Would you like to play as 'X' or 'O'?\n"
  result = gets.chomp.upcase

  # NOTE: Try not to manually handle loop termination!
  # loop do
  #   break if ['X', 'O'].include?(result)
  #   puts "You dummy. You can only pick 'X' or 'O'! Pick again."
  #   result = gets.chomp.upcase
  # end

  until ['X', 'O'].include?(result)
    puts "\nYou dummy. You can only pick 'X' or 'O'! Pick again."
    result = gets.chomp.upcase
  end
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

# NOTE: This is a bit too clever, isn't it?
# def which_player(last_player, player1, player2)
#   last_player == player1 ? player2 : player1
# end

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
  puts "\n\nPlayer #{player}: Please choose a space ...\n\n"
  show_board(board)
  result = gets.chomp
  available = board.select { |x| x.is_a? Fixnum }
  until result =~ /^[0-9]$/ && available.include?(result.to_i)
    puts "\nYou have to choose an available square!"
    result = gets.chomp
  end
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

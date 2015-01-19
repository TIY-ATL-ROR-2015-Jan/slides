require './hangman.rb'
require 'minitest/autorun'
require 'pry'

class TestHangman < Minitest::Test

  def setup
    @hanger = Hangman.new('cookies')
  end

  def test_has_greeting
    assert_equal @hanger.respond_to?(:greeting), true
  end

  def test_ttt_character_choice
    assert_equal @ttt.player1 == 'X', @ttt.player2 == 'O'
    assert_equal @ttt.player1 == 'O', @ttt.player2 == 'X'
  end
  # test that we can add letters
  # test that when a letter is added, turn count goes down if letter not there
  # test that when it's the last letter, the game ends
  # test that
end

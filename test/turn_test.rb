require 'minitest'
require "minitest/autorun"
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/messages'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @player_board = Board.new
    @computer_board = Board.new
    @message = Messages.new
    @turn = Turn.new(@player_board, @computer_board, @message)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_attributes
    assert_instance_of Board, @turn.player_board
    assert_instance_of Board, @turn.computer_board
    assert_instance_of Message, @turn.message
  end
end

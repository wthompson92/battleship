require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  # def setup
  #   @player_1 = Player.new #i want to initialize each player with a board object
  #   @player_2 = Player.new
  # end

  def test_players_exist
    player_1 = Player.new
    player_2 = Player.new

    assert_instance_of Player, player_1
    assert_instance_of Player, player_2
  end

  def test_player_attributes
    skip
    assert_equal "#{name}", player.name
    assert_equal @board, player.board
  end

  def test_create_ships
    skip
    assert_equal [cruiser, sub], player.create_board
  end

  def test_place_ships #do we need this?

  end
end

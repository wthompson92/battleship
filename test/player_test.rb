require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class PlayerTest < Minitest::Test

  def setup
    @player_1 = Player.new() #i want to initialize each player with a board object
    @player_2 = Player.new()
  end

  def test_players_exist
    assert_instance_of Player, @player_1
    assert_instance_of Player, @player_2
  end

  def test_player_attributes
    assert_equal
  end
end

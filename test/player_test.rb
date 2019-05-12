require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  def test_players_exist
    human = Player.new("Nina", true)
    computer = Player.new("Alyssa", false)

    assert_instance_of Player, human
    assert_instance_of Player, computer
  end

  def test_player_attributes
    human = Player.new("Nina", true)
    computer = Player.new("Alyssa", false)

    assert_equal "Nina", human.name
    assert_instance_of Board, human.board
    assert human.human
    refute computer.human
    assert_instance_of Hash, human.ships
  end

  def test_place_ships #how do we test this?
    skip
  end
end

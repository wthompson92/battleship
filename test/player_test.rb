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
  end

  def test_computer_fire_queue

  end

  #i think that we need a method in our board class that will
  #allow us to pass thru the coordinates that we're placing our ships at.
  #once we have that, we can

  def test_create_ships
    skip
    assert_equal [cruiser, sub], player.create_board
  end

  def test_place_ships #do we need this?
    skip
  end
end

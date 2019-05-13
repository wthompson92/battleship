require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/message'
require './lib/board'
require 'pry'

class MessageTest < Minitest::Test
def setup
  @message = Message.new
end

def test_message_exists

assert_instance_of Message, @message
end

def test_start_battleships

  assert_equal "Welcome to BattleShip", @message.start_battleships
end

def test_computer_can_place_ships_validly_and_randomly

  assert_equal , computer.place_ship(ship, [])
  assert_equal true, computer.valid_placement?(#array of placements)
end
end

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

def test_welcome_message

  assert_equal "Welcome to BattleShip", @message.welcome
end

def test_user_input

  assert_equal "I have laid out my ships on the grid.\n You now need to lay out your two ships. \n The Cruiser is two units long and the Submarine is three units long.", @message.user_input("p")
  assert_equal "Leaving BattleShip", @message.user_input("q")
  assert_equal "Invalid input.", @message.user_input("r")
end
end

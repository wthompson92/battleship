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
end

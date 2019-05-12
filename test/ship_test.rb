require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

 def setup
   @cruiser = Ship.new("Cruiser", 3)
 end

 def test_it_exists
   expected = Ship
   actual = @cruiser

   assert_instance_of expected, actual
 end

 def test_it_has_a_name
   expected = "Cruiser"
   actual = @cruiser.name

   assert_equal expected, actual
 end

 def test_it_has_a_length
   expected = 3
   actual = @cruiser.length

   assert_equal expected, actual
 end

 def test_it_has_health
   expected = 3
   actual = @cruiser.health

   assert_equal expected, actual
 end

 def test_if_it_sunk
   expected = false
   actual = @cruiser.sunk?

   assert_equal expected, actual
 end

 def test_it_has_been_hit
   @cruiser.hit
   expected = 2
   actual = @cruiser.health

   assert_equal expected, actual

   @cruiser.hit
   expected = 1
   actual = @cruiser.health

   assert_equal expected,actual
 end

 def test_it_can_be_sunk
   @cruiser.hit
   @cruiser.hit
   @cruiser.hit
   actual = @cruiser.sunk?
   assert actual
 end
end
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_ship_exists
    assert_instance_of Ship, @cruiser
  end

 def test_ship_has_name
    assert_equal "Cruiser", @cruiser.name
 end

 def test_ship_has_length
    assert_equal 3, @cruiser.length
 end

 def test_ship_has_health
    assert_equal 3, @cruiser.health
 end

 def test_if_ship_sunk
    assert_equal false, @cruiser.sunk?
 end

 def test_ship_has_been_hit
    @cruiser.hit
    assert_equal 1, @cruiser.hit_counter
  end


  def test_ship_can_be_sunk
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    actual = @cruiser.sunk?

    @cruiser.hit
    expected = 1
    actual = @cruiser.health
    assert_equal expected,actual
  end

 def test_ship_can_be_sunk
   @cruiser.hit
   @cruiser.hit
   @cruiser.hit
   actual = @cruiser.sunk?
   assert actual
 end
end

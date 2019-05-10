require "minitest"
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_ship_exists
    expected = Ship
    actual = @cruiser

    assert_instance_of expected, actual
  end

  def test_ship_has_a_name
    expected = "Cruiser"
    actual = @cruiser.name

    assert_equal expected, actual
  end

  def test_ship_has_a_length
    expected = 3
    actual = @cruiser.length

    assert_equal expected, actual
  end

  def test_ship_has_health
    expected = 3
    actual = @cruiser.health

    assert_equal expected, actual
  end

  def test_if_ship_starts_out_sunk
    expected = false
    actual = @cruiser.sunk?

    assert_equal expected, actual
  end

  def test_ship_has_been_hit
    @cruiser.hit
    expected = 2
    actual = @cruiser.health
    assert_equal expected, actual

    @cruiser.hit
    expected = 1
    actual = @cruiser.health
    assert_equal expected,actual
  end

  def test_ship_can_be_sunk
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit #won't work when i do @cruiser.hit * 3
    actual = @cruiser.sunk?

    assert_equal true, actual
  end
end

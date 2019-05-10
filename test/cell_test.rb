require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
     @cell = Cell.new("B4")
     @cruiser = Ship.new("Cruiser", 3)
     @cell_2 = Cell.new("C3")
  end

  def test_cell_exists
     expected = Cell
     actual = @cell

     assert_instance_of expected, actual
  end

  def test_cell_has_attributes
     expected = "B4"
     actual = @cell.coordinate

     assert_equal expected, actual
  end

  def test_cell_is_empty?
     actual = @cell.ship
     assert_nil actual

     actual = @cell.empty?
     assert actual
  end

  def test_it_can_place_ship
     @cell.place_ship(@cruiser)
     expected = @cruiser
     actual = @cell.ship

     assert_equal expected, actual

     actual = @cell.empty?
     refute actual
  end

  def test_it_can_be_fired_upon
     expected = false
     actual = @cell.fired_upon?

     assert_equal expected, actual

     @cell.place_ship(@cruiser)
     @cell.fire_upon
     expected = 2
     actual = @cell.fire_upon

     assert_equal expected, actual

     actual = @cell.fired_upon?
     assert actual
  end

  def test_it_can_render
    expected = "."
    actual = @cell.render

    assert_equal expected, actual

    @cell.fire_upon
    expected = "M"
    actual  = @cell.render

    assert_equal expected, actual

    @cell_2.place_ship(@cruiser)
    expected = "."
    actual = @cell_2.render

    assert_equal expected, actual

   @cell_2.place_ship(@cruiser)
   @cell_2.fire_upon
   expected = "H"
   actual = @cell_2.render

   assert_equal expected, actual

   @cell_2.place_ship(@cruiser)
   @cell_2.fire_upon
   @cruiser.hit
   @cruiser.hit
   expected = "X"
   actual  = @cell_2.render

  assert_equal expected, actual
  end
end

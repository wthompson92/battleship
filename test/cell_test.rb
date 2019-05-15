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
    assert_instance_of Cell, @cell
 end

 def test_cell_has_attributes
    assert_equal "B4", @cell.coordinate
 end

 def test_cell_is_empty?
    assert_nil @cell.ship
    assert @cell.empty?
 end

 def test_cell_can_place_ship
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
    refute @cell.empty?
 end

 def test_cell_can_be_fired_upon
    assert_equal false, @cell.fired_upon?

    @cell.place_ship(@cruiser)
    @cell.fire_upon

    assert_equal 2, @cell.fire_upon
    assert @cell.fired_upon?
 end

 def test_cell_can_render
   assert_equal ".", @cell.render

   @cell.fire_upon
   assert_equal "M", @cell.render

   @cell_2.place_ship(@cruiser)
   assert_equal ".", @cell_2.render

  @cell_2.place_ship(@cruiser)
  @cell_2.fire_upon
  assert_equal "H", @cell_2.render

  @cell_2.place_ship(@cruiser)
  @cell_2.fire_upon
  @cruiser.hit
  @cruiser.hit
 assert_equal "X", @cell_2.render
 end
end

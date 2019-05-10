require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/board'
require './lib/ship'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_the_board_instance_exists
    expected = Board
    actual = @board
    assert_instance_of expected, actual
  end

  def test_the_board_has_cells
    expected = Hash
    actual = @board.cells.class
    assert_equal expected, actual
  end

  def test_for_valid_coordinates

    @board.create_board

    actual = @board.valid_coordinate?("A1")
    assert actual

    actual = @board.valid_coordinate?("D4")
    assert actual

    actual = @board.valid_coordinate?("A5")
    refute actual

    actual = @board.valid_coordinate?("E1")
    refute actual

    actual = @board.valid_coordinate?("A22")
    refute actual
  end

  def test_num_of_coordinates_match_length
  @board.create_board

    actual = @board.valid_placement?(@submarine, ["A1", "A2"])
    assert actual
    actual = @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute actual
    actual = @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    refute actual
 end

  def test_coordinates_are_consecutive
    @board.create_board

    actual = @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert actual

    actual = @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute actual

    actual = @board.valid_placement?(@submarine, ["A1", "C1"])
    refute actual

    actual = @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    refute actual

    actual = @board.valid_placement?(@submarine, ["C1", "B1"])
    refute actual
  end

  def test_placements_are_not_diagonal
    @board.create_board

    actual = @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    refute actual


    actual = @board.valid_placement?(@submarine, ["C2", "D3"])
     refute actual
  end

  def test_that_there_are_valid_coordinates
@board.create_board
    actual = @board.valid_placement?(@submarine, ["A1", "A2"])
    assert actual

    actual = @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
    assert actual
  end

  def test_ships_can_be_placed
    @board.create_board
    #place method will take 2 parameter, a ship and an array of coordinates
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    expected = cell_1.ship
    actual = @cruiser

    assert_equal expected, actual
    actual = @cruiser
    expected = cell_2.ship
        assert_equal expected, actual
      actual = @cruiser
      expected = cell_3.ship
        assert assert_equal expected, actual
      actual = true
      expected = cell_3.ship == cell_2.ship
        assert_equal expected, actual

    end

    def test_overlapping_ships_are_not_allowed
    @board.create_board
    @board.place(@cruiser, ["A1", "A2", "A3"])
    actual = @board.valid_placement?(@submarine, ["A1", "B1"])
    refute actual
    end

    def test_the_board_can_render
      skip
      expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      actual = @board.render
      assert_equal expected, actual

@board.place(@cruiser, ["A1", "A2", "A3"])
      expected = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
      actual = board.render(true)
    end
  end

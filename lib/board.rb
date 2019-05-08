require './lib/ship'
require './lib/cell'
class Board
  attr_reader :cells

  def initialize
    @size = 16
    @keys = []
    @row = ("A".."D")
    @column = (1..4)
    @num = 0
    @cells = {}
    @coordinate = "A1"

  end

  def create_board
    @row.map do |letter|
    @column.map do |number|
      @keys << (letter + number.to_s)
      end
    end

   @keys.each do |key|
    @cells[key] = Cell.new(key.to_s)
    end
  @cells.keys
end

  def valid_coordinate?(coordinate)
   @keys.include?(coordinate)
end

  def valid_placement?(ship, coordinates)
    coordinates.all? do |coordinate|
    if   @keys.include?(coordinate.to_s) && coordinates.length == ship.length
      true
    end
  end
end
end

 board = Board.new
 cruiser = Ship.new("Cruiser", 3)
 board.create_board
 board.valid_coordinate?("A9")

p board.valid_placement?(cruiser, ["A1", "A2", "A3"])

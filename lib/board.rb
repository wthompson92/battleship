require './lib/ship'
require './lib/cell'
class Board
  attr_reader :cells

  def initialize

    @keys = []
    @row = ("A".."D")
    @column = (1..4)
    @num = 0
    @cells = {}

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

 

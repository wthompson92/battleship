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
 if coordinates.count == ship.length && coordinates.all? do |coordinate|
   valid_coordinate?(coordinate)
   end
   true
 else
   false
 end
 end
end

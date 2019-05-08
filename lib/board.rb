class Board
  attr_reader :cells

  def initialize
    @size = 16
    @cells = Hash.new(0)
    @row = ("A".."D")
    @column = (1..4)
    @num = 0

  end

  def create_board
    @row.map do |letter|
    @column.map do |number|
      @cells.store((letter + number.to_s), nil)
      end
    end
  end




  def valid_coordinate?(coordinate)
     @cells.include?(coordinate)
   end
end


board = Board.new
#p @cells.class
p board.create_board

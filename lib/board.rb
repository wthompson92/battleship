class Board
  attr_reader :cells

  def initialize
    @size = 16
    @cells = Hash.new
    @row = ("a".."d")
    @column = (1..4)
    @num = 0

  end

  def create_board
    @row.map do |x|
    (1..4).to_a.map do |i|
      x + i.to_s
      end
    end
  end





  def valid_coordinate?(coordinate)
     @cells.include?(coordinate)
   end
end


board = Board.new
p board.create_board

require './lib/board'

class Turn
  def initialize
    @board = Board.new
    @message = Message.new
  end

def fire(coordinate)
  if  @board.all_sunk? == false
      @message.take_shot_method
    @board.cells[coordinate].fire_upon
    @board.render
  else @board.all_sunk? == true
    puts "Game Over!"
end
end
end

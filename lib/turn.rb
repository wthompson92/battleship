require './lib/board'

class Turn
  def initialize(player_board, computer_board, message)
    @player_board = player_board
    @computer_board = computer_board
    @message = message
  end

  def setup(ship, placements)
    @player_board.place(ship, placements)
    puts "\n#{"=" * 3}COMPUTER BOARD#{"=" * 3}\n #{@computer_board.render}"
    print "\n#{"=" * 3}PLAYER BOARD#{"=" * 3}\n #{@player_board.render}"
  end

    def fire
    #change to or when computer places ships
    until @player_board.all_sunk? == true && @computer_board.all_sunk? == true do
      puts @message.take_shot_method
      coordinate = gets.chomp.to_s.upcase
      if @computer_board.valid_coordinate?(coordinate) == false
        puts "\n#{@message.invalid_shot_message}\n"
      else
        @computer_board.cells[coordinate].fire_upon
        puts "\n#{"=" * 3}COMPUTER BOARD#{"=" * 3}\n #{@computer_board.render}"
        puts "\n#{"=" * 3}PLAYER BOARD#{"=" * 3}\n #{@player_board.render(true)}"
      end
    end
  end
end

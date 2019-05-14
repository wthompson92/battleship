require './lib/board'

class Turn
  def initialize(player_board, computer_board, message)
    @player_board = player_board
    @computer_board = computer_board
    @message = message
  end

  def setup(ship, placements)
    until @player_board.valid_placement?(ship, placements) == true do
      @message.invalid_placements_messasge
    end
      @player_board.place(ship, placements)
      puts "#{@message.computer_board + @computer_board.render}"
      puts "#{@message.player_board + @player_board.render(true)}"
  end

  def fire
    until @player_board.all_sunk? == true && @computer_board.all_sunk? == true do
      @message.take_shot_method
      coordinate = gets.chomp.to_s.upcase
      if !@computer_board.valid_coordinate?(coordinate) then @message.invalid_shot_message
      else
        @computer_board.cells[coordinate].fire_upon
        puts "#{@message.computer_board + @computer_board.render}"
        keys = @player_board.cells.keys.shuffle!
        @player_board.cells[keys.pop].fire_upon
        puts "#{@message.computer_board + @computer_board.render}"
        puts "#{@message.player_board + @player_board.render(true)}"
    end
  end
end

  def end_game
    if @player_board.all_sunk? == true
      puts @message.end_game_message_computer_win
    elsif @computer_board.all_sunk? == true
      puts @message.end_game_message_player_win
    else
      puts "Error!"
    end
  end
end

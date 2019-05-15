require './lib/board'
require 'pry'

class Turn
  def initialize(player_board, computer_board, message)
    @player_board = player_board
    @computer_board = computer_board
    @message = message
  end

  def num_generator
    rand(0..1)
  end

  def get_computer_placement_coords
    random_coordinate = @computer_board.cells.keys.shuffle.pop
    letter_or_num = random_coordinate.chars[num_generator]
    possible_placements = @computer_board.cells.keys.select do |cell|
    cell.include?(letter_or_num)
    end
  end

  def place_comp_ships(ship)
    number = ship.health
    trial = []
    until @computer_board.valid_placement?(ship, trial) do
      trial = get_computer_placement_coords.take(number)
    end
      @computer_board.place(ship, trial)
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
    keys = @player_board.cells.keys.shuffle!
    until @player_board.all_sunk? == true && @computer_board.all_sunk? == true do
      @message.take_shot_method
      coordinate = gets.chomp.to_s.upcase
      if !@computer_board.valid_coordinate?(coordinate) then @message.invalid_shot_message
      else
        @computer_board.cells[coordinate].fire_upon
        puts "#{@message.computer_board + @computer_board.render}"
        @player_board.cells[keys.pop].fire_upon
        puts "#{@message.computer_board + @computer_board.render}"
        puts "#{@message.player_board + @player_board.render(true)}"
    end
  end
end

  def end_game
    if @player_board.all_sunk? && !@computer_board.all_sunk?
      puts @message.end_game_message_computer_win
    elsif @computer_board.all_sunk? && @computer_board.all_sunk?
      puts @message.end_game_message_player_win
    else
      puts "Error!"
    end
  end
end

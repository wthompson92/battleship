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

  def setup(ship)
    placements = gets.chomp.upcase.split(" ").to_a
    until @player_board.valid_placement?(ship, placements) == true do
      @message.invalid_placements_messasge
      placements = gets.chomp.upcase.split(" ").to_a
    end
      @player_board.place(ship, placements)
      puts "#{@message.computer_board + @computer_board.render}"
      puts "#{@message.player_board + @player_board.render}"
  end

  def fire
    keys = @player_board.cells.keys.shuffle!
    until @player_board.all_sunk? || @computer_board.all_sunk? do
      @message.take_shot_method
      coordinate = gets.chomp.to_s.upcase
      if !@computer_board.valid_coordinate?(coordinate) then @message.invalid_shot_message
      else
        @computer_board.cells[coordinate].fire_upon
        coord_2 = keys.last
        @player_board.cells[keys.pop].fire_upon
        print "#{@message.computer_board + @computer_board.render}"
        print "#{@message.player_board + @player_board.render}"
        print @message.player_shot_messages(@computer_board, coordinate)
        print @message.computer_shot_messages(@player_board, coord_2)
      end
    end
  end

  def end_game
    if @player_board.all_sunk? && !@computer_board.all_sunk?
      puts @message.end_game_message_computer_win
    else @computer_board.all_sunk? && !@player_board.all_sunk?
      puts @message.end_game_message_player_win
    end
  end
end

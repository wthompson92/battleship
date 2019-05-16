require './lib/cell'
require './lib/board'
require './lib/ship'
require './lib/messages'
require './lib/turn'
require 'pry'

message = Messages.new
message.main_menu
input = gets.chomp
  if input == "q"
    print "\nLeaving Battleship\n"
  end
while input == "p"
  loop do
cruiser = Ship.new("Cruiser", 3)
submarine =  Ship.new("Submarine", 2)
cruiser_2 = Ship.new("Cruiser", 3)
submarine_2 =  Ship.new("Submarine", 2)
player_board = Board.new(true)
computer_board = Board.new(false)
player_board.create_board
computer_board.create_board
turn = Turn.new(player_board, computer_board, message)
turn.place_comp_ships(cruiser_2)
turn.place_comp_ships(submarine_2)
print computer_board.render
message.prompt_placement_cruiser
turn.setup(cruiser)
message.prompt_placement_sub
turn.setup(submarine)
turn.fire
turn.end_game
message.main_menu
input = gets.chomp
  end
end

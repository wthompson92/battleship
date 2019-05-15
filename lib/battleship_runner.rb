require './lib/cell'
require './lib/board'
require './lib/ship'
require './lib/messages'
require './lib/turn'
require 'pry'

message = Messages.new
cruiser = Ship.new("Cruiser", 3)
submarine =  Ship.new("Submarine", 2)
player_board = Board.new
computer_board = Board.new
turn = Turn.new(player_board, computer_board, message)
message.main_menu
input = gets.chomp
message.play_or_leave(input)
player_board.create_board
computer_board.create_board
turn.place_comp_ships(cruiser)
turn.place_comp_ships(submarine)
print computer_board.render
message.prompt_placement_cruiser
turn.setup(cruiser)
message.prompt_placement_sub
turn.setup(submarine)
turn.fire
turn.end_game
message.main_menu
input = gets.chomp
message.play_or_leave(input)

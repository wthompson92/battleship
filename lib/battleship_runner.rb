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
placements = ["A1", "A2", "A3"]
placements_2 = ["C1", "D1"]
turn = Turn.new(player_board, computer_board, message)
message.main_menu
input = gets.chomp
message.play_or_leave(input)
player_board.create_board
computer_board.create_board
message.prompt_placement_cruiser(placements)
turn.setup(cruiser, placements)
message.prompt_placement_sub(placements_2)
turn.setup(submarine, placements_2)
turn.fire
turn.end_game
turn.main_menu



 # board.cells["A1"].fire_upon
 # print board.render(true)
 # board.cells["A2"].fire_upon
 # print board.render(true)
 # board.cells["A3"].fire_upon
 # print board.render(true)
 # board.cells["D4"].fire_upon
 # print board.render(true)
 # board.cells["D1"].fire_upon
 # print board.render(true)
 # board.cells["B2"].fire_upon
 # print board.render(true)
 # board.cells["B4"].fire_upon
 # print board.render(true)

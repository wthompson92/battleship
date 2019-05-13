require './lib/cell'
require './lib/board'
require './lib/ship'
require './lib/messages'

message = Messages.new
cruiser = Ship.new("Cruiser", 3)
submarine =  Ship.new("Submarine", 2)
board = Board.new
message.main_menu
input = "p"
message.play_or_leave(input)
board.create_board
board.render
placements = ["A1", "A2", "A3"]
message.prompt_placement_cruiser(placements)
board.place(cruiser, placements)
board.valid_placement?(cruiser, placements)
board.render

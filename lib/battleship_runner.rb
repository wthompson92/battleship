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
print board.render
placements = ["A1", "A2", "A3"]
placements_2 = ["B2", "B3"]
message.prompt_placement_cruiser(placements)
message.prompt_placement_sub(placements_2)
board.place(cruiser, placements)
print board.render
board.place(submarine, placements_2)
print board.render
# message.take_shot_method
 board.cells["A1"].fire_upon
 print board.render
 board.cells["A2"].fire_upon
 print board.render
 board.cells["A3"].fire_upon
 print board.render
 board.cells["D4"].fire_upon
 print board.render

class Messages

  def main_menu
    print "\n\t\t\t***Welcome to Battleship!***\n\n\tEnter [p] to play: \t\t\tEnter [q] to quit:\n>"
  end

  def computer_board
    "\n#{"=" * 3}COMPUTER BOARD#{"=" * 3}\n"
  end

  def player_board
    "\n#{"=" * 3}PLAYER BOARD#{"=" * 3}\n "
  end

  def prompt_placement_cruiser
    print "\nI have laid out my ships on the grid. You now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long.
    \n\nEnter the squares for the Cruiser (3 spaces):\n>"
  end

  def prompt_placement_sub
    print "\n Now enter the squares for the Submarine (2 spaces):\n>"
  end

  def invalid_placements_messasge
    print "\nThose are invalid coordinates, try again\n"
  end

  def take_shot_method
    print "\n\nEnter the coordinate for your shot: \n > "
  end

  def invalid_shot_message
    print "\nThat is an invalid coordinate to fire on. Please try again.\n"
  end

  def player_shot_messages(computer_board, coordinate)
    ship = computer_board.cells[coordinate].ship
    status = computer_board.cells[coordinate].render
    case status
    when "M" then  "\n* Your shot on #{coordinate} was a miss. *"
    when "H" then  "\n* Your shot on #{coordinate} was a hit on #{ship.name}! *"
    when "X" then "\n* Your shot on #{coordinate} was a hit and has sunk #{ship.name}. *"
    end
  end

  def computer_shot_messages(player_board, coord_2)
    ship = player_board.cells[coord_2].ship
    status = player_board.cells[coord_2].render
    case status
    when "M" then "\n* My shot on #{coord_2} was a miss. *"
    when "H" then "\n* My shot on #{coord_2} was a hit on #{ship.name}! *"
    when "X" then "\n* My shot on #{coord_2} was a hit and has sunk #{ship.name}! *"
    end
  end

  def end_game_message_player_win
    print "\n\t***GAME OVER***\n\nYou win!\n"
  end

  def end_game_message_computer_win
    print "\n\t***GAME OVER***\n\nI win!\n"
  end
end

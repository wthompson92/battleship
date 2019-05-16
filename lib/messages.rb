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
    print "\n Great! Now enter the squares for the Submarine (2 spaces):\n>"
  end

  def invalid_placements_messasge
    print "Those are invalid coordinates, try again\n"
  end

  def take_shot_method
    print "\nEnter the coordinate for your shot: \n > "
  end

  def invalid_shot_message
    print "That is an invalid coordinate to fire on. Please try again.\n"
  end

  def player_shot_messages(computer_board, coordinate)
    status = computer_board.cells[coordinate].render(false)
    case status
    when "M" then p "Your shot on #{coordinate} was a miss."
    when "H" then p "Your shot on #{coordinate} was a hit on #{status.ship}"
    when "X" then p "Your shot on #{coordinate} was a hit and has sunk #{status.ship}."
    end
  end

  def computer_shot_messages(player_board, coordinate)
    status = player_board.cells[coordinate].render
    case status
    when "M" then  p "My shot on #{coordinate} was a miss."
    when "H" then p "My shot on #{coordinate} was a hit on #{status.ship}"
    when "X" then p "My shot on #{coordinate} was a hit and has sunk #{status.ship}."
    end
  end

  def end_game_message_player_win
    print "\n\t***GAME OVER***\n\nYou win!\n"
  end

  def end_game_message_computer_win
    print "\n\t***GAME OVER***\n\nI win!\n"
  end
end

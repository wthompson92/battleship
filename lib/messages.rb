class Messages
def main_menu
  p "Welcome to Battleship\n Enter [p] to play \nEnter [q] to quit"
end

def play_or_leave(input)
  if input == "p" then p "I have laid out my ships on the grid.
You now need to lay out your t  ``    wo ships.
The Cruiser is three units long and the Submarine is two units long."
elsif input == "q" then p "Leaving Battleship"
else p "Invalid entry. Please enter [p] to play or [q] to quit"
end
end

def prompt_placement_cruiser(placements)
  p "Enter the squares for the Cruiser (3 spaces)"
end


def prompt_placement_sub(placements)
  p "Enter the squares for the Submarine (2 spaces):"
end

def invalid_placements_messasge(placements)
  p "Those are invalid coordinates, try again"
  end


  def take_shot_method
    p "Enter the coordinate for your shot:"
  end

  def invalid_shot_message
    p "That is an invalid coordinate to fire on. Please try again:"
end

  def player_shot_miss
    p "Your shot on #{fire} was a miss."
  end

  def computer_shot_miss
    p "My shot on #{fire} was a miss."
  end

  def player_shot_hit
      p "Your shot on #{fire} was a hit on #{ship}."
  end

  def computer_shot_hit
    p "My shot on #{fire} was a hit on #{ship}."
  end

  def player_shot_sunk_shit
    p "Your shot on #{fire} was a hit and has sunk the #{ship}."
  end

  def computer_shot_sunk
    p "My shot on #{fire} was a hit and has sunk #{ship}."
  end

  def end_game_message_player_win
    p "Game Over\nYou win!"
  end

  def end_game_message_computer_win
    p "Game Over\n I win!"
  end
end

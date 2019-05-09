class Message
  #attr_reader

def initialize
end

def welcome
    return "Welcome to BattleShip"
end

def user_input(input)

    if input == "p"
      "I have laid out my ships on the grid.\n You now need to lay out your two ships. \n The Cruiser is two units long and the Submarine is three units long."
    elsif input == "q"
      "Leaving BattleShip"
    else
      "Invalid input."
    end
end
end

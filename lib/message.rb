require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
#require './lib/turn'

class Message
  attr_reader :human, :computer 

  def initialize(name)
    @human = Player.new(name, true)
    @computer = Player.new("Alyssa", false)
  end

  def start_battleships
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp

    if input == "p"
      "I have laid out my ships on the grid.\n You now need to lay out your two ships. \n The Cruiser is two units long and the Submarine is three units long."
    elsif input == "q"
      "Leaving BattleShip"
    else
      "Invalid response." #how can i prompt the user back to lines 4/5 of code.
    end
  end
end

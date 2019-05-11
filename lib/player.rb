class Player
  attr_reader :name, :board

  def initialize(name) #what else does a player need to be initialized?
    @name = name
    @board = Board.new

  end

  def create_ships #do you think that this would be better in the initialize method?
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]
  end

end

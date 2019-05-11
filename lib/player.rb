class Player
  attr_reader :name, :board

  def initialize(name, human) #what else does a player need to be initialized?
    @name = name
    @board = Board.new
    @human = human #this parameter should be a boolean
  end

  def fire
      if @human == false
        #generating number to be passed inside the methods

      elsif @human == true

  end

  def create_ships #do you think that this would be better in the initialize method?
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]
  end

  assign computer movements randomly random method

end

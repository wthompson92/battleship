class Player
  attr_reader :name, :board, :human

  def initialize(name, human) #what else does a player need to be initialized?
    @name = name
    @board = Board.new
    @human = human #this parameter should be a boolean
  end

  def fire(coordinate)
      if @human == false
        #generating number to be passed inside the methods
        firing_queue = [] #should be strings?
          @row.each do |letter|
            @column.each do |number|
              firing_queue << [letter, number]
            end
          end
          firing_queue.shuffle!
      elsif @human == true
      end
  end

  def create_ships #do you think that this would be better in the initialize method?
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]
  end

  #assign computer movements randomly random method

end

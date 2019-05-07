class Cell
attr_reader :coordinate, :ship

def initialize(coordinate)
  @coordinate = coordinate
  @fired_upon = false
  @ship = nil
end

def empty?
   if @ship == nil
     true
   else
      false
   end
 end

 def place_ship(ship)
  @ship = ship
  end

  def fired_upon?
   @fired_upon
  end

end

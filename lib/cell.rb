class Cell
 attr_reader :coordinate, :ship

 def initialize(coordinate)
   @coordinate = coordinate
   @fired_upon = false
   @ship = nil
 end

 def empty?
   @ship == nil
 end

 def place_ship(ship)
   @ship = ship
 end

 def fired_upon?
   @fired_upon
 end

 def fire_upon
   @fired_upon = true
   if empty? == false then @ship.hit
   end
 end

 def render
   if @fired_upon == false && empty? == true
     @coordinate = "."
   elsif @fired_upon == false  && empty? == false
    @coordinate = "S"

   elsif @fired_upon == true && empty? == true
     @coordinate = "M"
   elsif @fired_upon == true && empty? == false && @ship.sunk? == false
     @coordinate = "H"
   elsif @fired_upon == true && empty? == false && @ship.sunk? == true
     @coordinate = "X"
   end
 end
end
end

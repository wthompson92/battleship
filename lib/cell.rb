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

 def render(reveal)
   if @fired_upon == false && empty? == true
     @coordinate = "."
   elsif @fired_upon == false  && empty? == false && reveal == true
    @coordinate = "S"
   elsif @fired_upon == true && empty? == true
     @coordinate = "M"
   elsif @fired_upon == true && !empty? && @ship.sunk? == false
     @coordinate = "H"
   elsif @fired_upon == true && !empty? && @ship.sunk?
     @coordinate = "X"
   end
 end
end

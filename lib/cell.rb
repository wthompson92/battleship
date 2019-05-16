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
   if !empty? == true then @ship.hit
   end
 end

 def render(reveal = false)
   if !@fired_upon && (empty? || !reveal) then "."
   elsif !@fired_upon && (!empty? && reveal) then  "S"
   elsif @fired_upon && empty? then "M"
   elsif @fired_upon  && !empty? && !@ship.sunk? then "H"
   elsif @fired_upon && !empty? && @ship.sunk? then "X"
   end
 end
end

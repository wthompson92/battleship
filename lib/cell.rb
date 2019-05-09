class Cell
attr_reader :coordinate, :ship #okay can you explain to me again why we only need these attributes in our attr_reader as opposed to all of them?


def initialize(coordinate)
  @coordinate = coordinate
  @fired_upon = false
  #@ship = [] why won't this line of code work when paired with line 31?
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

def fire_upon
  @fired_upon = true
    if empty? == false
      @ship.hit
    end
end

def render
  if @fired_upon == false
  @coordinate = "."
 elsif @fired_upon == true && empty? == true
   @coordinate = "M"
 elsif @fired_upon == true && empty? == false && @ship.sunk? == false
   @coordinate = "H"
elsif @fired_upon == true && empty? == false && @ship.sunk? == true
   @coordinate = "X"
 end
end
end

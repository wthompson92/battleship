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

end

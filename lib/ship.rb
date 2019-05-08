class Ship
  attr_reader :name, :health, :length #three attributes that we wanna know about and view 

  def initialize(name, length)
      @name = name
      @health = length
      @length = length
      @sunk = false
      @hit_counter = 0
  end

  def sunk?
    if @hit_counter >= @health
      @sunk = true
    end
    @sunk
  end

  def hit
    @health -= 1
    @hit_counter += 1
  end
end

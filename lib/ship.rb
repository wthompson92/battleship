class Ship
  attr_reader :name, :health, :length, :hit_counter #three attributes that we wanna know about and view

  def initialize(name, health)
      @name = name
      @health = health
      @length = health
      @sunk = false
      @hit_counter = 0 #I really like this idea and don't think that I would have that of this
  end

  def sunk?
    if @hit_counter >= @health
      @sunk = true
    end
    @sunk
  end

  def hit
    @hit_counter += 1
  end
end

class Ship
  attr_reader :name, :health, :length #three attributes that we wanna know about and view

  def initialize(name, length)
      @name = name
      @health = length
      @length = length
      @sunk = false
      @hit_counter = 0 #I really like this idea and don't think that I would have that of this
  end

  def sunk?
    if @hit_counter <= @health
      @sunk = false
    else
      @sunk = true
    end
    @sunk
  end

  def hit
    @hit_counter += 1
  end
end

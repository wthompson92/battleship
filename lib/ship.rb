class Ship
  attr_reader :name,
              :health,
              :length

  def initialize(name,health)
    @name = name
    @health = health
    @length = health
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

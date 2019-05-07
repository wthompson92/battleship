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

end

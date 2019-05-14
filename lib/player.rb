require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Player
  attr_reader :name, :board, :human, :ships

  def initialize(name, human) #what else does a player need to be initialized?
    @name = name
    @board = Board.new
    @human = human #this parameter should be a boolean
    @ships = Hash.new
    create_ships
  end

  def create_ships
    @ships = {cruiser: Ship.new("Cruiser", 3),
       submarine: Ship.new("Submarine", 2)}

  end

  def place_ships #better name for this?
    ships.each do |ship|
      puts "Place #{ship.name}"
      input = gets.chomp #this should be an array

      if @board.valid_placements?(ship, input) == true
      end
    end

  end

end
binding.pry

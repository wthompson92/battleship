require './lib/ship'
require './lib/cell'
require 'pry'
class Board
  attr_reader :cells

  def initialize

    @keys = []
    @row = ("A".."D")
    @column = (1..4)
    @cells = {}
    @ships = []

  end

  def create_board
    @row.map {|letter|
    @column.map {|number| @keys << (letter + number.to_s)
    @keys.map {|key| @cells[key] = Cell.new(key)}}}
    @cells
end

  def valid_coordinate?(input)
   @keys.include?(input)
  end

  def valid_placement?(ship, placements)
    create_board
    letters = get_letters(placements)
    letters_consecutive?(letters)

    numbers = get_numbers(placements)
    numbers_consecutive?(numbers)

    return false if placements.count != ship.length
    return false if placements.any? {|placement| !valid_coordinate?(placement)}
    return false if placements.any? {|placement| !@cells[placement].empty?}
    return true if letters.uniq.count == 1 && numbers_consecutive?(numbers)
    return true if numbers.uniq.count == 1 && letters_consecutive?(letters)

    end


def get_letters(placements) #passing thru an array
 letters = []
 placements.each do |placement|
   letters << placement[0] #getting our letter
 end
 letters
end

def get_numbers(placements) #passing thru an array
 numbers = []
 placements.each do |placement|
   numbers << placement[1] #getting our number
 end
 numbers
end

def letters_consecutive?(letters) #(array of strings passed from line 60)
     if (letters.count == 3) && (letters.last.ord - letters.first.ord == 2)
       return true
     elsif (letters.count == 2) && (letters.last.ord - letters.first.ord == 1)
       return true
     else
       return false
     end
end
end

def numbers_consecutive?(numbers) #(array of strings passed from line 60)
     if (numbers.count == 3) && (numbers.last.to_i - numbers.first.to_i == 2)
       true
     elsif (numbers.count == 2) && (numbers.last.to_i - numbers.first.to_i == 1)
       return true
     else
       return false
     end
  def place(ship, placements)
    if valid_placement?(ship, placements)
      placements.each { |placement| @cells[placement].place_ship(ship) }
        @ships << ship
    end
  end
end

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
    placements.each { |placement|letters << placement[0] } #getting our letter
    letters
  end

  def get_numbers(placements) #passing thru an array
    numbers = []
    placements.each { |placement|numbers << placement[1] }#getting our number
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

  def numbers_consecutive?(numbers) #(array of strings passed from line 60)
    if (numbers.count == 3) && (numbers.last.to_i - numbers.first.to_i == 2)
      return true
    elsif (numbers.count == 2) && (numbers.last.to_i - numbers.first.to_i == 1)
      return true
    else
      return false
    end
  end

  def place(ship, placements)
    if valid_placement?(ship, placements)
    then placements.each {|placement| @cells[placement].place_ship(ship)}
    end
  end
end

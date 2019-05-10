require './lib/cell'
class Board
  attr_reader :cells
  def initialize
    @keys = []
    @column = ("A".."D")
    @row = (1..4)
    @cells = {}
  end

  def create_board
    @column.map {|letter|
    @row.map {|number| @keys << (letter + number.to_s)
    @keys.map {|key| @cells[key] = Cell.new(key)}}}
  end

  def valid_coordinate?(coordinate)
   @keys.include?(coordinate)
  end

  def valid_placement?(ship, placements)
    letters = get_letters(placements)
    numbers = get_numbers(placements)
    return false if placements.count != ship.length
    return false if placements.any? {|placement| !valid_coordinate?(placement)}
    return false if placements.any? {|placement| !@cells[placement].empty?}
    return true if letters.uniq.count == 1 && numbers_consecutive?(numbers)
    return true if numbers.uniq.count == 1 && letters_consecutive?(letters)
  end

  def get_letters(placements) #passing thru an array
    letters = placements.map { |placement| placement[0] } #getting our letter
  end

  def get_numbers(placements) #passing thru an array
    numbers = placements.map { |placement| placement[1] }#getting our number
  end

  def letters_consecutive?(letters) #(array of strings passed from line 60)
    if (letters.count == 3) && (letters.last.ord - letters.first.ord == 2) then true
    elsif (letters.count == 2) && (letters.last.ord - letters.first.ord == 1) then true
    end
  end

  def numbers_consecutive?(numbers) #(array of strings passed from line 60)
    if (numbers.count == 3) && (numbers.last.to_i - numbers.first.to_i == 2) then true
    elsif (numbers.count == 2) && (numbers.last.to_i - numbers.first.to_i == 1) then  true
    end
  end

  def place(ship, placements)
    if valid_placement?(ship, placements)
       then placements.each {|placement| @cells[placement].place_ship(ship)}
    end
  end

  def render(reveal = false)

    x_axis = @row.to_a.map {|num| num.to_s + " " }
    y_axis = @column.to_a.map {|letter| "\n#{letter}"}
    board = "\n #{(x_axis + y_axis).join}\n"
  end
end

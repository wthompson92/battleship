require './lib/cell'
class Board
  attr_reader :cells
  def initialize
    @keys = []
    @column = ("A".."D")
    @row = (1..4)
    @cells = {}
    @ships = []
  end

  def create_board
    @column.each {|letter|
    @row.each {|number| @keys << (letter + number.to_s)
    @keys.each {|key| @cells[key] = Cell.new(key)}}}
    @cells
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
       then placements.map {|placement| @cells[placement].place_ship(ship)}
    @ships << ship
    end
  end

  def render(reveal = false)
    board = []
    array_of_cells = []
<<<<<<< HEAD
<<<<<<< HEAD
    @cells.map {|key, value| array_of_cells << (" " + value.render)}
=======
    @cells.each {|key, value| array_of_cells << (" " + value.render)}
>>>>>>> 7e513691cddfa89973cf3c039c37a575c557b03f
=======
    @cells.each {|key, value| array_of_cells << (" " + value.render)}
>>>>>>> 7e513691cddfa89973cf3c039c37a575c557b03f
    x_axis = @row.to_a.map {|num| board << num.to_s + " " }
    board.push(" ")
    y_axis = @column.zip(array_of_cells.each_slice(4))
    y_axis.each{|letter| board <<  "\n" + letter.join}
<<<<<<< HEAD
<<<<<<< HEAD
    board.push(" ")
=======
>>>>>>> 7e513691cddfa89973cf3c039c37a575c557b03f
=======
>>>>>>> 7e513691cddfa89973cf3c039c37a575c557b03f
    board.push("\n")
    board.unshift(" ")
    board.join
  end
end

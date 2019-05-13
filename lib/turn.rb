
class Turn 
  attr_reader

  def initialize

  end

  def start


  end

  def firing_queue
    firing_queue = []
      if @human == false
        #generating number to be passed inside the method
          @player.board.row.each do |letter|
            @player.board.column.each do |number|
              firing_queue << [letter, number]
            end
          end
          firing_queue.shuffle!
      end
  end


class Board
  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  end

  def position(user_input)
    @cells[user_input.to_i-1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(position)
    @cells[position.to_i - 1] != " "
  end

  def valid_move?(user_input)
    user_input.to_i <=9 && user_input.to_i >=1 && !taken?(user_input)
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

  def get_valid_cell_positions
    valid_positions = []
    @cells.each_with_index do |cell,index|
      if @cells[index] == " "
        valid_positions << index
      end
    end
    return valid_positions
  end

end

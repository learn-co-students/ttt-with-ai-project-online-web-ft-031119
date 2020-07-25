module Players

  class Computer < Player
    def move(board)
      valid_positions = board.get_valid_cell_positions
      return valid_positions[rand(0...valid_positions.length)] + 1
    end
  end
end

module Players

  class Computer < Player
    def move(board)
      pos = rand(1..9)
      if board.valid_move?(pos)
        return pos.to_s
      else
        move
      end
    end
  end

end

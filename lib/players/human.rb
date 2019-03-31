module Players
  class Human < Player

    def move(board)
      input = gets.chomp
      if board.valid_move?(input)
        board.update(input,self)
        return input
      else
        return "invalid"
      end
    end

  end
end

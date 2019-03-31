class Game
  attr_accessor :board, :player_1, :player_2
  # attr_reader
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turn = board.turn_count
    if board.turn_count % 2 == 1
      return player_2
    end
    player_1
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      cells = board.cells
      if cells[combo[0]] == cells[combo[1]] && cells[combo[1]] == cells[combo[2]] && cells[combo[0]] != " "
        return combo
      end
    end
    return false
  end

  def draw?
    if !self.won? && board.full?
      return true
    end
    return false
  end

  def over?
    if board.full?
      return true
    end
    return false
  end

  def winner
    if won?
      return board.cells[won?[0]]
    end
  end

  def turn
    if current_player.move(board) == "invalid"
      turn
    end
  end

  def play
    while over? == false
      turn
      if draw?
        puts "Cat's Game!"
        break
      elsif won?
        puts "Congratulations #{winner}!"
        break
      end
    end
  end

end

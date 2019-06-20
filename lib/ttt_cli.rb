class Cli
  attr_accessor :game
  def run
    intro
    select_players
    game.board.display
    while !game.won?
      game.play
    end

  end

  def intro
    puts "Welcome to Tic Tac Toe!"
  end

  def select_players
    puts "Please select number of human players (0-2):"
    input = gets.chomp
    if input.to_i >= 0 && input.to_i <= 2

      case input.to_i
      when 0
        p1 = Players::Computer.new("X")
        p2 = Players::Computer.new("O")
      when 1
        p1 = Players::Human.new("X")
        p2 = Players::Computer.new("O")
      when 2
        p1 = Players::Human.new("X")
        p2 = Players::Human.new("O")
      end
      @game = Game.new(player_1 = p1,player_2 = p2)
    else
      puts "Selection invalid."
      select_players
    end
  end
end

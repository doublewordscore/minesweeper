require_relative 'board'
require_relative 'tile'
require_relative 'player'

class Minesweeper
  def initialize(board, player)
    @board = board
    @player = player
  end

  def play
    until board.won? || @board.bomb_hit?
      @board.render
      current_move = @player.get_move
      if current_move[0] == 'f'
        if @board.grid[current_move[1]].revealed
          puts "cant flag a revealed tile"
        else
          
    end



  end





end

Minesweeper.new(Board.new, Player.new("fred"))

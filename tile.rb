class Tile
  DELTAS = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  attr_accessor :position, :revealed, :flagged
  attr_reader :bomb

  def initialize(board, bomb = false, position = nil)
    @flagged = false
    @revealed = revealed
    @bomb = bomb
    @board = board
    @position = position
  end

  def flag
    @flagged.true? ? false : true
  end

  def reveal
    if flagged
      puts "can't reveal a flagged tile"
    else
      @revealed = true
    end
  end

  def inspect

    @bomb.inspect
  end

  def create_tiles
    tiles = []
    15.times { tiles << Tile.new(@grid, bomb = true) }
    66.times { tiles << Tile.new(@grid) }
    tiles = tiles.shuffle
  end

  def neighbors
    neighbors = []
    offset_pos = DELTAS.map do |rel_pos|
      neighbors << [@position[0] + rel_pos[0], @position[1] + rel_pos[1]]
    end
    neighbors.reject { |x| x[0] < 0 || x[1] < 0 ||
                        x[0] > @board.grid[0].length-1 ||
                        x[1] > @board.grid[0].length-1 }

  end

  def neighbor_bomb_count
    neighbors.count do |pos|
      @board[pos].bomb
    end
  end



end

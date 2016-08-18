require_relative 'tile'
require 'byebug'

class Board
  def initialize(grid = nil)
    if grid.nil?
      @grid = Array.new(9) { Array.new(9)}
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def populate
    bomb_count = 0
    tiles = create_tiles

    9.times do |row|
      9.times do |col|
        next_tile = tiles.shift
        next_tile.position = [row, col]
        self[[row, col]] = next_tile
        # self.[]=([row, col])
      end
    end


    render


  end

  def render
    @grid.each do |row|
      row.each do |tile|
        if tile.revealed == false
          print "*"
        elsif tile.revealed == true && tile.neighbor_bomb_count > 0
          print "#{neighbor_bomb_count}"
        elsif tile.revealed == true && tile.neighbor_bomb_count.zero?
          print "_"
        end
      end
      puts
    end

  end

  def create_tiles
    tiles = []
    15.times { tiles << Tile.new(@grid, bomb = true) }
    66.times { tiles << Tile.new(@grid) }
    tiles = tiles.shuffle
  end

  def bomb_hit?
    @grid.each do |row|
      row.each do |tile|
        return true if (tile.bomb == true && tile.revealed == true)
      end
    end
    false
  end




end

Board.new.populate

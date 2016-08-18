class Player

  def initialize(name)
    @name = name

  end

  def get_move
    puts 'enter r for reveal.  enter f for flag'
    move_type = gets.chomp.downcase
    puts 'enter a move (x,y)'
    move = gets.chomp.map(&:to_i)
    [move_type, move]
  end





end

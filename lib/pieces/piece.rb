class Piece
  attr_reader :y_pos, :x_pos, :color, :squares_threatened

  def initialize(y, x, color)
    @y_pos = y
    @x_pos = x
    @color = color
    @has_moved = false
    @squares_threatened = []
    @valid_moves = []
    @valid_captures = []
  end

end
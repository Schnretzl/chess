class Piece

  def initialize(y, x, color)
    @y_pos = y
    @x_pos = x
    @color = color
    @has_moved = false
    @squares_threatened = []
    @valid_moves = []
  end

end
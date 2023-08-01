class Piece
  def initialize(x, y, color)
    @xPos = x
    @yPos = y
    @color = color
    @has_moved = false
    @squares_threatened = []
    @valid_moves = []
  end
end
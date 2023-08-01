class Piece
  @@board = nil

  def initialize(x, y, color)
    @x_pos = x
    @y_pos = y
    @color = color
    @has_moved = false
    @squares_threatened = []
    @valid_moves = []
  end

  def self.set_board(board)
    @@board = board
  end
end
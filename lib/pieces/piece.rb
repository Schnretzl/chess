class Piece
  @@board = nil

  def initialize(y, x, color)
    @y_pos = y
    @x_pos = x
    @color = color
    @has_moved = false
    @squares_threatened = []
    @valid_moves = []
  end

  def self.set_board(board)
    @@board = board
  end

  def empty?(y, x)
    @@board.grid[y][x] == ' '
  end
end
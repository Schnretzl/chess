require_relative '../piece'

class Rook < Piece
  def initialize(y, x, color)
    super(y, x, color)
    set_squares_threatened
    # set_valid_moves
  end

  def set_squares_threatened
    @squares_threatened = []
    add_squares_up
    # add_squares_down
    # add_squares_left
    # add_squares_right
  end

  def add_squares_up
    column = @x_pos
    row = @y_pos
    until !@@board.empty?(row, column) || row <= 0
      @squares_threatened << [column, row]
      column -= 1
    end
  end
end
require_relative '../piece'

class King < Piece
  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened(board)
  end

  def set_squares_threatened(board)
    @set_squares_threatened << [@y_pos - 1, @x_pos] unless @y_pos.zero? || board.grid[@y_pos - 1, @x_pos] != ' '
    @set_squares_threatened << [@y_pos - 1, @x_pos + 1] unless @y_pos.zero? || @x_pos == 7 ||
                                                               board.grid[@y_pos - 1, @x_pos + 1] != ' '
    @set_squares_threatened << [@y_pos, @x_pos + 1] unless @x_pos == 7 || board.grid[@y_pos, @x_pos + 1] != ' '
    @set_squares_threatened << [@y_pos + 1, @x_pos + 1] unless @y_pos == 7 || @x_pos == 7 ||
                                                               board.grid[@y_pos + 1, @x_pos + 1] != ' '
    @set_squares_threatened << [@y_pos + 1, @x_pos] unless @y_pos == 7 || board.grid[@y_pos + 1, @x_pos] != ' '
    @set_squares_threatened << [@y_pos + 1, @x_pos - 1] unless @y_pos == 7 || @x_pos.zero? ||
                                                               board.grid[@y_pos + 1, @x_pos - 1] != ' '
    @set_squares_threatened << [@y_pos, @x_pos - 1] unless @x_pos == 0 || board.grid[@y_pos, @x_pos - 1] != ' '
    @set_squares_threatened << [@y_pos + 1, @x_pos - 1] unless @y_pos == 0
  end
end
require_relative '../piece'

class Knight < Piece
  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened(board)
    set_valid_moves(board)
  end

  def set_squares_threatened(board)
    @squares_threatened << [@y_pos + 1, @x_pos + 2] unless @y_pos >= 7 || @x_pos >= 6 ||
                                                           board.grid[@y_pos + 1][@x_pos + 2] != ' '
    @squares_threatened << [@y_pos - 1, @x_pos + 2] unless @y_pos.zero? || @x_pos >= 6 ||
                                                           board.grid[@y_pos - 1][@x_pos + 2] != ' '
    @squares_threatened << [@y_pos - 2, @x_pos + 1] unless @y_pos <= 1 || @x_pos >= 7 ||
                                                           board.grid[@y_pos - 2][@x_pos + 1] != ' '
    @squares_threatened << [@y_pos - 2, @x_pos - 1] unless @y_pos <= 1 || @x_pos.zero? ||
                                                           board.grid[@y_pos - 2][@x_pos - 1] != ' '
    @squares_threatened << [@y_pos - 1, @x_pos - 2] unless @y_pos.zero? || @x_pos <= 1 ||
                                                           board.grid[@y_pos - 1][@x_pos - 2] != ' '
    @squares_threatened << [@y_pos + 1, @x_pos - 2] unless @y_pos >= 7 || @x_pos <= 1 ||
                                                           board.grid[@y_pos + 1][@x_pos - 2] != ' '
    @squares_threatened << [@y_pos + 2, @x_pos - 1] unless @y_pos >= 6 || @x_pos.zero? ||
                                                           board.grid[@y_pos + 2][@x_pos - 1] != ' '
    @squares_threatened << [@y_pos + 2, @x_pos + 1] unless @y_pos >= 6 || @x_pos >= 7 ||
                                                           board.grid[@y_pos + 2][@x_pos + 1] != ' '
  end

  def set_valid_moves(board)
    @squares_threatened.each { |move| @valid_moves << move if board.grid[move[0]][move[1]] == ' ' }
  end
end
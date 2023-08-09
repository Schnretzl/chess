require_relative '../piece'

module ThreatensOrthogonally

  def set_squares_threatened(board)
    @squares_threatened = []
    add_squares_up(board)
    add_squares_down(board)
    add_squares_left(board)
    add_squares_right(board)
  end

  def add_squares_up(board)
    column = @x_pos
    row = @y_pos - 1
    until !board.empty?(row, column) || row.negative?
      @squares_threatened << [row, column]
      row -= 1
    end
  end

  def add_squares_down(board)
    column = @x_pos
    row = @y_pos + 1
    until !board.empty?(row, column) || row > 7
      @squares_threatened << [row, column]
      row += 1
    end
  end

  def add_squares_left(board)
    column = @x_pos - 1
    row = @y_pos
    until !board.empty?(row, column) || column.negative?
      @squares_threatened << [row, column]
      column -= 1
    end
  end

  def add_squares_right(board)
    column = @x_pos + 1
    row = @y_pos
    until !board.empty?(row, column) || column > 7
      @squares_threatened << [row, column]
      column += 1
    end
  end
end

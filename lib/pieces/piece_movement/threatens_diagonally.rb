module ThreatensDiagonally
  def set_squares_threatened(board)
    @squares_threatened.clear
    add_squares_up_right(board)
    add_squares_up_left(board)
    add_squares_down_right(board)
    add_squares_down_left(board)
  end

  def add_squares_up_right(board)
    column = @x_pos + 1
    row = @y_pos - 1
    until !board.empty?(row, column) || row < 0 || column > 7
      @squares_threatened << [row, column]
      row -= 1
      column += 1
    end
  end

  def add_squares_up_left(board)
    column = @x_pos - 1
    row = @y_pos - 1
    until !board.empty?(row, column) || row < 0 || column < 0
      @squares_threatened << [row, column]
      row -= 1
      column -= 1
    end
  end

  def add_squares_down_right(board)
    column = @x_pos + 1
    row = @y_pos + 1
    until !board.empty?(row, column) || column > 7 || row > 7
      @squares_threatened << [row, column]
      column += 1
      row += 1
    end
  end

  def add_squares_down_left(board)
    column = @x_pos + 1
    row = @y_pos - 1
    until !board.empty?(row, column) || column > 7 || row < 0
      @squares_threatened << [row, column]
      column += 1
      row -= 1
    end
  end
end
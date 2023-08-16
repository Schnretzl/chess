require_relative '../piece'

module CapturesDiagonally
  def set_valid_captures(board)
    @valid_captures.clear
    opponent_color = color == 'white' ? 'black' : 'white'
    add_captures_up_right(board, opponent_color)
    add_captures_up_left(board, opponent_color)
    add_captures_down_right(board, opponent_color)
    add_captures_down_left(board, opponent_color)
  end

  def add_captures_up_right(board, opponent_color)
    column = @x_pos + 1
    row = @y_pos - 1
    until !board.empty?(row, column) || row.negative? || column > 7
      row -= 1
      column += 1
    end
    !row.negative? && column <= 7 && !board.empty?(row, column) && board.grid[row][column].color == opponent_color &&
      (@valid_captures << [row, column])
  end

  def add_captures_up_left(board, opponent_color)
    column = @x_pos - 1
    row = @y_pos - 1
    until !board.empty?(row, column) || row.negative? || column.negative?
      row -= 1
      column -= 1
    end
    !row.negative? && !column.negative? && !board.empty?(row, column) && board.grid[row][column].color == opponent_color &&
      (@valid_captures << [row, column])
  end

  def add_captures_down_right(board, opponent_color)
    row = @y_pos + 1
    column = @x_pos + 1
    until !board.empty?(row, column) || row > 7 || column > 7
      row += 1
      column += 1
    end
    row <= 7 && column <= 7 && !board.empty?(row, column) && board.grid[row][column].color == opponent_color &&
      (@valid_captures << [row, column])
  end

  def add_captures_down_left(board, opponent_color)
    row = @y_pos + 1
    column = @x_pos - 1
    until !board.empty?(row, column) || row.negative? || column > 7
      row += 1
      column -= 1
    end
    row <= 7 && !column.negative? && !board.empty?(row, column) && board.grid[row][column].color == opponent_color &&
      (@valid_captures << [row, column])
  end
end
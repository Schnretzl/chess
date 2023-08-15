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
    board.grid[row][column].color == opponent_color && @valid_captures << [row, column]
  end

  def add_captures_up_left(board, opponent_color)
    column = @x_pos - 1
    row = @y_pos - 1
    until !board.empty?(row, column) || row.negative? || column.negative?
      row -= 1
      column -= 1
    end
    board.grid[row][column].color == opponent_color && @valid_captures << [row, column]
  end

  def add_captures_down_right(board, opponent_color)
    column = @x_pos + 1
    row = @y_pos + 1
    until !board.empty?(row, column) || column > 7 || row > 7
      column += 1
      row += 1
    end
    board.grid[row][column].color == opponent_color && @valid_captures << [row, column]
  end

  def add_captures_down_left(board, opponent_color)
    column = @x_pos + 1
    row = @y_pos - 1
    until !board.empty?(row, column) || column > 7 || row.negative?
      column += 1
      row -= 1
    end
    board.grid[row][column].color == opponent_color && @valid_captures << [row, column]
  end
end
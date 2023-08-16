require_relative '../piece'

module CapturesOrthogonally
  def set_valid_captures(board)
    @valid_captures.clear
    opponent_color = color == 'white' ? 'black' : 'white'
    add_capture_up(board, opponent_color)
    add_capture_down(board, opponent_color)
    add_capture_left(board, opponent_color)
    add_capture_right(board, opponent_color)
  end

  def add_capture_up(board, opponent_color)
    row = @y_pos - 1
    row -= 1 until row.negative? || !board.empty?(row, @x_pos)
    !row.negative? && !board.empty?(row, @x_pos) && board.grid[row][@x_pos].color == opponent_color &&
      (@valid_captures << [row, @x_pos])
  end

  def add_capture_down(board, opponent_color)
    row = @y_pos + 1
    row += 1 until row > 7 || !board.empty?(row, @x_pos)
    row <= 7 && !board.empty?(row, @x_pos) && board.grid[row][@x_pos].color == opponent_color &&
      (@valid_captures << [row, @x_pos])
  end

  def add_capture_left(board, opponent_color)
    column = @x_pos - 1
    column -= 1 until column.negative? || !board.empty?(@y_pos, column)
    !column.negative? && board.empty?(@y_pos, column) && board.grid[@y_pos][column].color == opponent_color &&
      (@valid_captures << [@y_pos, column])
  end

  def add_capture_right(board, opponent_color)
    column = @x_pos + 1
    column += 1 until column > 7 || !board.empty?(@y_pos, column)
    column <= 7 && board.empty?(@y_pos, column) && board.grid[@y_pos][column].color == opponent_color &&
      (@valid_captures << [@y_pos, column])
  end
end
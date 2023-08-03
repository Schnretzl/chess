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
    add_squares_down
    add_squares_left
    add_squares_right
  end

  def add_squares_up
    column = @x_pos
    row = @y_pos - 1
    until !@@board.empty?(row, column) || row < 0
      @squares_threatened << [row, column]
      row -= 1
    end
  end

  def add_squares_down
    column = @x_pos
    row = @y_pos + 1
    until !@@board.empty?(row, column) || row > 7
      @squares_threatened << [row, column]
      row += 1
    end
  end

  def add_squares_left
    column = @x_pos - 1
    row = @y_pos
    until !@@board.empty?(row, column) || column < 0
      @squares_threatened << [row, column]
      column -= 1
    end
  end

  def add_squares_right
    column = @x_pos + 1
    row = @y_pos
    until !@@board.empty?(row, column) || column > 7
      @squares_threatened << [row, column]
      column += 1
    end
  end
end
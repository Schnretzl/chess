require_relative '../piece'

class Knight < Piece
  def initialize(x, y, color)
    super(x, y, color)
    set_squares_threatened
    set_valid_moves
  end

  def set_squares_threatened
    @squares_threatened << [@x_pos + 1, @y_pos + 2] unless (@x_pos >= 7 || @y_pos >= 6)
    @squares_threatened << [@x_pos - 1, @y_pos + 2] unless (@x_pos == 0 || @y_pos >= 6)
    @squares_threatened << [@x_pos - 2, @y_pos + 1] unless (@x_pos <= 1 || @y_pos >= 7)
    @squares_threatened << [@x_pos - 2, @y_pos - 1] unless (@x_pos <= 1 || @y_pos == 0)
    @squares_threatened << [@x_pos - 1, @y_pos - 2] unless (@x_pos == 0 || @y_pos <= 1)
    @squares_threatened << [@x_pos + 1, @y_pos - 2] unless (@x_pos >= 7 || @y_pos <= 1)
    @squares_threatened << [@x_pos + 2, @y_pos - 1] unless (@x_pos >= 6 || @y_pos == 0)
    @squares_threatened << [@x_pos + 2, @y_pos + 1] unless (@x_pos >= 6 || @y_pos >= 7)
  end

  def set_valid_moves
    @squares_threatened.each do |move|
      @valid_moves << move if @@board.grid[move[0]][move[1]] == ' '
    end
  end
end
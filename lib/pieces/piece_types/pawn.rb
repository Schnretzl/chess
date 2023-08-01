require_relative '../piece'

class Pawn < Piece
  def initialize(x, y, color)
    super(x, y, color)
    set_squares_threatened
    set_valid_moves
  end

  def set_squares_threatened
    if @color == 'black'
      @squares_threatened << [@x_pos - 1, @y_pos + 1] unless (@x_pos == 0 || @y_pos == 7)
      @squares_threatened << [@x_pos + 1, @y_pos + 1] unless (@x_pos == 7 || @y_pos == 7)
    elsif @color == 'white'
      @squares_threatened << [@x_pos - 1, @y_pos - 1] unless (@x_pos == 0 || @y_pos == 0)
      @squares_threatened << [@x_pos + 1, @y_pos - 1] unless (@x_pos == 7 || @y_pos == 0)
    end
  end

  def set_valid_moves
    if @color == 'black'
      @y_pos < 7 && @@board.grid[@x_pos][@y_pos + 1] == ' ' && (@valid_moves << [@x_pos, @y_pos + 1])
      !@has_moved && (@valid_moves << [@x_pos, @y_pos + 2])
    end
  end
end
require_relative '../piece'

class Pawn < Piece
  def initialize(y, x, color)
    super(y, x, color)
    set_squares_threatened
    set_valid_moves
  end

  def set_squares_threatened
    if @color == 'black'
      @squares_threatened = []
      @squares_threatened << [@y_pos - 1, @y_pos + 1] unless (@x_pos == 0 || @y_pos == 7)
      @squares_threatened << [@y_pos + 1, @y_pos + 1] unless (@x_pos == 7 || @y_pos == 7)
    elsif @color == 'white'
      @squares_threatened = []
      @squares_threatened << [@y_pos - 1, @y_pos - 1] unless (@x_pos == 0 || @y_pos == 0)
      @squares_threatened << [@y_pos + 1, @y_pos - 1] unless (@x_pos == 7 || @y_pos == 0)
    end
  end

  def set_valid_moves
    if @color == 'black'
      @valid_moves = []
      @y_pos < 7 && @@board.grid[@y_pos][@x_pos + 1] == ' ' && (@valid_moves << [@y_pos, @x_pos + 1])
      !@has_moved && (@valid_moves << [@y_pos, @x_pos + 2])
    elsif @color == 'white'
      @valid_moves = []
      @y_pos < 7 && @@board.grid[@y_pos][@x_pos - 1] == ' ' && (@valid_moves << [@y_pos, @x_pos - 1])
      !@has_moved && (@valid_moves << [@y_pos, @x_pos - 2])
    end
  end
end
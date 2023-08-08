require_relative '../piece'

class Pawn < Piece
  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened
    set_valid_moves(board)
  end

  def set_squares_threatened(board)
    if @color == 'black'
      @squares_threatened = []
      @squares_threatened << [@y_pos + 1, @x_pos - 1] unless @y_pos == 7 || @x_pos.zero? ||
                                                             board[@y_pos + 1, @x_pos - 1] != ' '
      @squares_threatened << [@y_pos + 1, @x_pos + 1] unless @y_pos == 7 || @x_pos == 7 ||
                                                             board[@y_pos + 1, @x_pos + 1] != ' '
    elsif @color == 'white'
      @squares_threatened = []
      @squares_threatened << [@y_pos - 1, @x_pos - 1] unless @y_pos == 0 || @x_pos == 0 ||
                                                             board.grid[@y_pos - 1][@x_pos - 1]
      @squares_threatened << [@y_pos - 1, @x_pos + 1] unless @y_pos == 0 || @x_pos == 7 ||
                                                             board.grid[@y_pos - 1, @x_pos + 1]
    end
  end

  def set_valid_moves(board)
    if @color == 'black'
      @valid_moves = []
      @y_pos < 7 && board.grid[@y_pos + 1][@x_pos] == ' ' && (@valid_moves << [@y_pos + 1, @x_pos])
      !@has_moved && (@valid_moves << [@y_pos + 2, @x_pos])
    elsif @color == 'white'
      @valid_moves = []
      @y_pos < 7 && board.grid[@y_pos - 1][@x_pos] == ' ' && (@valid_moves << [@y_pos - 1, @x_pos])
      !@has_moved && (@valid_moves << [@y_pos - 2, @x_pos])
    end
  end
end
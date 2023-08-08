require_relative '../piece'

class Pawn < Piece
  attr_reader :color

  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened(board)
    set_valid_moves(board)
    set_valid_captures(board)
  end

  def set_squares_threatened(board)
    if @color == 'black'
      @squares_threatened = []
      @squares_threatened << [@y_pos + 1, @x_pos - 1] unless @y_pos == 7 || @x_pos.zero? ||
                                                             board.grid[@y_pos + 1][@x_pos - 1] != ' '
      @squares_threatened << [@y_pos + 1, @x_pos + 1] unless @y_pos == 7 || @x_pos == 7 ||
                                                             board.grid[@y_pos + 1][@x_pos + 1] != ' '
    elsif @color == 'white'
      @squares_threatened = []
      @squares_threatened << [@y_pos - 1, @x_pos - 1] unless @y_pos == 0 || @x_pos == 0 ||
                                                             board.grid[@y_pos - 1][@x_pos - 1]
      @squares_threatened << [@y_pos - 1, @x_pos + 1] unless @y_pos == 0 || @x_pos == 7 ||
                                                             board.grid[@y_pos - 1][@x_pos + 1]
    end
  end

  def set_valid_moves(board)
    @valid_moves = []
    if @color == 'black'
      @y_pos < 7 && board.grid[@y_pos + 1][@x_pos] == ' ' && (@valid_moves << [@y_pos + 1, @x_pos])
      !@has_moved && (@valid_moves << [@y_pos + 2, @x_pos])
    elsif @color == 'white'
      @y_pos < 7 && board.grid[@y_pos - 1][@x_pos] == ' ' && (@valid_moves << [@y_pos - 1, @x_pos])
      !@has_moved && (@valid_moves << [@y_pos - 2, @x_pos])
    end
  end

  def set_valid_captures(board)
    @valid_captures = []
    if @color == 'black'
      down_left = board.grid[@y_pos + 1][@x_pos - 1]
      down_right = board.grid[@y_pos + 1][@x_pos + 1]
      !down_left.nil? && down_left.class != String && down_left.color == 'white' &&
        (@valid_captures << [@y_pos + 1, @x_pos - 1])
      down_left.nil? && down_right.class != String && down_right.color == 'white' &&
        (@valid_captures << [@y_pos + 1, @x_pos + 1])
    elsif @color == 'white'
      down_left = board.grid[@y_pos - 1][@x_pos - 1]
      down_right = board.grid[@y_pos - 1][@x_pos + 1]
      !down_left.nil? && down_left.class != String && down_left.color == 'black' &&
        (@valid_captures << [@y_pos - 1, @x_pos - 1])
      down_left.nil? && down_right.class != String && down_right.color == 'black' &&
        (@valid_captures << [@y_pos - 1, @x_pos + 1])
    end
  end
end
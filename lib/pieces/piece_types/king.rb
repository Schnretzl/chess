require_relative '../piece'

class King < Piece
  attr_reader :is_in_check

  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened(board)
    set_valid_moves(board)
    @is_in_check = false
  end

  def set_squares_threatened(board)
    @squares_threatened << [@y_pos - 1, @x_pos] unless @y_pos.zero? || board.grid[@y_pos - 1][@x_pos] != ' '
    @squares_threatened << [@y_pos - 1, @x_pos + 1] unless @y_pos.zero? || @x_pos == 7 ||
                                                           board.grid[@y_pos - 1][@x_pos + 1] != ' '
    @squares_threatened << [@y_pos, @x_pos + 1] unless @x_pos == 7 || board.grid[@y_pos][@x_pos + 1] != ' '
    @squares_threatened << [@y_pos + 1, @x_pos + 1] unless @y_pos == 7 || @x_pos == 7 ||
                                                           board.grid[@y_pos + 1][@x_pos + 1] != ' '
    @squares_threatened << [@y_pos + 1, @x_pos] unless @y_pos == 7 || board.grid[@y_pos + 1][@x_pos] != ' '
    @squares_threatened << [@y_pos + 1, @x_pos - 1] unless @y_pos == 7 || @x_pos.zero? ||
                                                           board.grid[@y_pos + 1][@x_pos - 1] != ' '
    @squares_threatened << [@y_pos, @x_pos - 1] unless @x_pos.zero? || board.grid[@y_pos][@x_pos - 1] != ' '
    @squares_threatened << [@y_pos - 1, @x_pos - 1] unless @y_pos.zero? || @x_pos.zero? ||
                                                           board.grid[@y_pos - 1][@x_pos - 1] != ' '
  end

  def set_valid_moves(board)
    @valid_moves = []
    if @color == 'black'
      @squares_threatened.each do |square|
        @valid_moves << square unless board.black_king_threatened_squares.include?(square)
      end
    else
      @squares_threatened.each do |square|
        @valid_moves << square unless board.white_king_threatened_squares.include?(square)
      end
    end
  end

  def set_check_status(board)
    opponent_color = @color == 'white' ? 'black' : 'white'
    return board.white_king_threatened_squares.include?([@y_pos, @x_pos]) if opponent_color == 'white'

    board.black_king_threatened_squares.include?([@y_pos, @x_pos])
  end
end
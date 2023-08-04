require_relative '../piece'
require_relative '../piece_movement/threatens_diagonally'

class Bishop < Piece
  include ThreatensDiagonally
  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened(board)
    # set_valid_moves
  end

end
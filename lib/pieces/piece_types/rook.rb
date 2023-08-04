require_relative '../piece'
require_relative '../piece_movement/threatens_orthogonally'

class Rook < Piece
  include ThreatensOrthogonally
  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened(board)
    # set_valid_moves
  end

end
require_relative '../piece'
require_relative '../piece_movement/threatens_orthogonally'
require_relative '../piece_movement/threatens_diagonally'

class Queen < Piece
  include ThreatensOrthogonally
  include ThreatensDiagonally
  def initialize(y, x, color, board)
    super(y, x, color)
    ThreatensOrthogonally.instance_method(:set_squares_threatened).bind(self).call(board)
    ThreatensDiagonally.instance_method(:set_squares_threatened).bind(self).call(board)
  end
end
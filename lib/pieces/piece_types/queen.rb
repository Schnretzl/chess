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
    set_valid_moves(board)
  end

  def set_valid_moves(board)
    @valid_moves = []
    @squares_threatened.each { |square| @valid_moves << square }
  end
end
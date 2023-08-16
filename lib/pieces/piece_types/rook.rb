require_relative '../piece'
require_relative '../piece_movement/threatens_orthogonally'
require_relative '../piece_movement/captures_orthogonally'

class Rook < Piece
  include ThreatensOrthogonally
  include CapturesOrthogonally
  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened(board)
    set_valid_moves(board)
    set_valid_captures(board)
  end

  def set_valid_moves(board)
    @valid_moves.clear
    @squares_threatened.each { |square| @valid_moves << square }
  end
end
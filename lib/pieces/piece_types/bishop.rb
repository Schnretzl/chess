require_relative '../piece'
require_relative '../piece_movement/threatens_diagonally'
require_relative '../piece_movement/captures_diagonally'

class Bishop < Piece
  include ThreatensDiagonally
  include CapturesDiagonally
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
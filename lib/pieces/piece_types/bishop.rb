require_relative '../piece'
require_relative '../piece_movement/threatens_diagonally'

class Bishop < Piece
  include ThreatensDiagonally
  def initialize(y, x, color, board)
    super(y, x, color)
    set_squares_threatened(board)
    set_valid_moves(board)
  end

  def set_valid_moves(board)
    @valid_moves = []
    @squares_threatened.each { |square| @valid_moves << square }
  end
end
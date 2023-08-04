require_relative '../piece'

class King < Piece
  def initialize(y, x, color, board)
    super(y, x, color)
  end
end
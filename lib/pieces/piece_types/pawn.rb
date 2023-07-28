require 'piece'

class Pawn < Piece
  def initialize(x, y, color)
    super(xPos, yPos, color)
  end
end
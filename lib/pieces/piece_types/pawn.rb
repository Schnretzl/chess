require_relative '../piece'

class Pawn < Piece
  def initialize(x, y, color)
    super(x, y, color)
    set_squares_threatened
  end

  def set_squares_threatened
    if @color == 'black'
      @squares_threatened << [@xPos - 1, @yPos + 1] unless (@xPos == 0 || @yPos == 7)
      @squares_threatened << [xPos + 1, yPos + 1] unless (@xPos == 7 || @yPos == 7)
    elsif @color == 'white'
      @squares_threatened << [@xPos - 1, @yPos - 1] unless (@xPos == 0 || @yPos == 0)
      @squares_threatened << [@xPos + 1, @yPos - 1] unless (@xPos == 7 || @yPos == 0)
    end
  end
end
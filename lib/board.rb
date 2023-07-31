require 'player'
require 'piece'

class Board
  def initialize
    @grid = Array.new(size) { Array.new(size, ' ') }
    @white_king_threatened_squares = []
    @black_king_threatened_squares = []
    add_white_pieces
    add_black_pieces
  end


  private

  def add_black_pieces
    add_pawns(black)
    add_rooks(black)
    add_knights(black)
    add_bishops(black)
    add_queen(black)
    add_king(black)
  end
  
  def add_white_pieces
    add_pawns(white)
    add_rooks(white)
    add_knights(white)
    add_bishops(white)
    add_queen(white)
    add_king(white)
  end

  def add_pawns(color)
    if color == 'black'
      @grid[1].map!.with_index { |square, index| Pawn.new(index, 1, 'black') }
    elsif color == 'white'
      @grid[6].map!.with_index { |square, index| Pawn.new(index, 6, 'white') }
    end
  end

  def add_rooks
    if color == 'black'
      @grid[0][0] = Rook.new(0, 0, 'black')
      @grid[0][7] = Rook.new(0, 7, 'black')
    elsif color == 'white'
      @grid[7][0] = Rook.new(0, 0, 'white')
      @grid[7][7] = Rook.new(0, 7, 'white')
    end
  end
  
end
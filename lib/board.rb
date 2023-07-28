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

  
end
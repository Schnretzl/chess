require_relative 'player'
require_relative 'pieces/piece'
Dir['/home/whendley/repos/chess/lib/pieces/piece_types/*.rb'].each { |file| require file }

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, ' ') }
    @white_king_threatened_squares = []
    @black_king_threatened_squares = []
    @pieces = []
    add_white_pieces
    add_black_pieces
  end

  def empty?(y, x)
    return false unless (0..7).include?(y) && (0..7).include?(x)

    @grid[y][x] == ' '
  end

  private

  def add_black_pieces
    add_pawns('black')
    add_king('black')
    add_queen('black')
    add_bishops('black')
    add_knights('black')
    add_rooks('black')
  end

  def add_white_pieces
    add_pawns('white')
    add_king('white')
    add_queen('white')
    add_bishops('white')
    add_knights('white')
    add_rooks('white')
  end

  def add_pawns(color)
    if color == 'black'
      @grid[1].map!.with_index do |square, index|
        pawn = Pawn.new(1, index, 'black', self)
        @pieces << pawn
        pawn
      end
    elsif color == 'white'
      @grid[6].map!.with_index do |square, index|
        pawn = Pawn.new(6, index, 'white', self)
        @pieces << pawn
        pawn
      end
    end
  end

  def add_king(color)
    if color == 'black'
      @grid[0][4] = king = King.new(0, 4, 'black', self)
      @pieces << king
    elsif color == 'white'
      @grid[7][4] = king = King.new(7, 4, 'white', self)
      @pieces << king
    end 
  end

  def add_queen(color)
    if color == 'black'
      @grid[0][3] = queen = Queen.new(0, 3, 'black', self)
      @pieces << queen
    elsif color == 'white'
      @grid[7][3] = queen = Queen.new(7, 3, 'white', self)
      @pieces << queen
    end 
  end

  def add_bishops(color)
    if color == 'black'
      @grid[0][2] = bishop1 = Bishop.new(0, 2, 'black', self)
      @grid[0][5] = bishop2 = Bishop.new(0, 5, 'black', self)
      @pieces.concat([bishop1, bishop2])
    elsif color == 'white'
      @grid[7][2] = bishop1 = Bishop.new(7, 2, 'white', self)
      @grid[7][5] = bishop2 = Bishop.new(7, 5, 'white', self)
      @pieces.concat([bishop1, bishop2])
    end 
  end

  def add_knights(color)
    if color == 'black'
      @grid[0][1] = knight1 = Knight.new(0, 1, 'black', self)
      @grid[0][6] = knight2 = Knight.new(0, 6, 'black', self)
      @pieces.concat([knight1, knight2])
    elsif color == 'white'
      @grid[7][1] = knight1 = Knight.new(7, 1, 'white', self)
      @grid[7][6] = knight2 = Knight.new(7, 6, 'white', self)
      @pieces.concat([knight1, knight2])
    end 
  end

  def add_rooks(color)
    if color == 'black'
      @grid[0][0] = rook1 = Rook.new(0, 0, 'black', self)
      @grid[0][7] = rook2 = Rook.new(0, 7, 'black', self)
      @pieces.concat([rook1, rook2])
    elsif color == 'white'
      @grid[7][0] = rook1 = Rook.new(7, 0, 'white', self)
      @grid[7][7] = rook2 = Rook.new(7, 7, 'white', self)
      @pieces.concat([rook1, rook2])
    end
  end

end

test = Board.new
test.grid[0][5] = ' '
test.grid[1][5] = ' '
test.grid[5][5] = Rook.new(5, 5, 'black', test)
# test.grid[5][5].add_squares_up
# test.grid[1][1].set_squares_threatened
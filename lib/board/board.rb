require './lib/player/player'
require './lib/pieces/piece'
Dir['/home/whendley/repos/chess/lib/pieces/piece_types/*.rb'].each { |file| require file }

class Board
  attr_reader :grid, :white_king_threatened_squares, :black_king_threatened_squares, :pieces

  def initialize
    @grid = Array.new(8) { Array.new(8, ' ') }
    @pieces = []
    add_pieces('white')
    add_pieces('black')
    @white_king_threatened_squares = []
    @black_king_threatened_squares = []
    set_squares_threatening_king('white')
    set_squares_threatening_king('black')
    @player1 = Player.new('white')
    @player2 = Player.new('black')
  end

  def empty?(y, x)
    return false unless (0..7).include?(y) && (0..7).include?(x)

    @grid[y][x] == ' '
  end

  # private

  def add_pieces(color)
    add_pawns(color)
    add_queen(color)
    add_bishops(color)
    add_knights(color)
    add_rooks(color)
    add_king(color)
  end

  def add_pawns(color)
    row = color == 'white' ? 6 : 1
    @grid[row].map!.with_index do |_square, index|
      pawn = Pawn.new(row, index, color, self)
      @pieces << pawn
      pawn
    end
  end

  def add_king(color)
    row = color == 'white' ? 7 : 0
    @grid[row][4] = king = King.new(row, 4, color, self)
    @pieces << king
  end

  def add_queen(color)
    row = color == 'white' ? 7 : 0
    @grid[row][3] = queen = Queen.new(row, 3, color, self)
    @pieces << queen
  end

  def add_bishops(color)
    row = color == 'white' ? 7 : 0
    @grid[row][2] = bishop1 = Bishop.new(row, 2, color, self)
    @grid[row][5] = bishop2 = Bishop.new(row, 5, color, self)
    @pieces.push(bishop1, bishop2)
  end

  def add_knights(color)
    row = color == 'white' ? 7 : 0
    @grid[row][1] = knight1 = Knight.new(row, 1, color, self)
    @grid[row][6] = knight2 = Knight.new(row, 6, color, self)
    @pieces.push(knight1, knight2)
  end

  def add_rooks(color)
    row = color == 'white' ? 7 : 0
    @grid[row][0] = rook1 = Rook.new(row, 0, color, self)
    @grid[row][7] = rook2 = Rook.new(row, 7, color, self)
    @pieces.push(rook1, rook2)
  end

  def set_squares_threatening_king(color)
    opponent_pieces = @pieces.select { |piece| piece.color != color }
    if color == 'white'
      @white_king_threatened_squares = opponent_pieces.flat_map(&:squares_threatened).uniq
    elsif color == 'black'
      @black_king_threatened_squares = opponent_pieces.flat_map(&:squares_threatened).uniq
    end
  end

end

test = Board.new
test.grid[2][0] = test_rook = Rook.new(2, 0, 'white', test)
test.pieces.push(test_rook)
test.grid[1][1].set_valid_captures(test)
test.grid[1][5] = ' '
test.grid[5][5] = King.new(5, 5, 'black', test)
test.set_squares_threatening_king('black')
j=0
# test.grid[5][5].add_squares_up
# test.grid[1][1].set_squares_threatened
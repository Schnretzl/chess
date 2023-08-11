require './lib/player/player'
require './lib/pieces/piece'
Dir['/home/whendley/repos/chess/lib/pieces/piece_types/*.rb'].each { |file| require file }

class Board
  attr_reader :grid, :white_king_threatened_squares, :black_king_threatened_squares

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

  private

  def add_pieces(color)
    add_pawns(color)
    add_queen(color)
    add_bishops(color)
    add_knights(color)
    add_rooks(color)
    set_squares_threatening_king(color)
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
      @pieces.push(bishop1, bishop2)
    elsif color == 'white'
      @grid[7][2] = bishop1 = Bishop.new(7, 2, 'white', self)
      @grid[7][5] = bishop2 = Bishop.new(7, 5, 'white', self)
      @pieces.push(bishop1, bishop2)
    end 
  end

  def add_knights(color)
    if color == 'black'
      @grid[0][1] = knight1 = Knight.new(0, 1, 'black', self)
      @grid[0][6] = knight2 = Knight.new(0, 6, 'black', self)
      @pieces.push(knight1, knight2)
    elsif color == 'white'
      @grid[7][1] = knight1 = Knight.new(7, 1, 'white', self)
      @grid[7][6] = knight2 = Knight.new(7, 6, 'white', self)
      @pieces.push(knight1, knight2)
    end 
  end

  def add_rooks(color)
    if color == 'black'
      @grid[0][0] = rook1 = Rook.new(0, 0, 'black', self)
      @grid[0][7] = rook2 = Rook.new(0, 7, 'black', self)
      @pieces.push(rook1, rook2)
    elsif color == 'white'
      @grid[7][0] = rook1 = Rook.new(7, 0, 'white', self)
      @grid[7][7] = rook2 = Rook.new(7, 7, 'white', self)
      @pieces.push(rook1, rook2)
    end
  end

  def set_squares_threatening_king(color)
    opponent_color = (color == 'white') ? 'black' : 'white'
    opponent_pieces = @pieces.select { |piece| piece.color == opponent_color }

    if color == 'white'
      @white_king_threatened_squares = opponent_pieces.flat_map(&:squares_threatened).uniq
    elsif color == 'black'
      @black_king_threatened_squares = opponent_pieces.flat_map(&:squares_threatened).uniq
    end
  end

end

test = Board.new
test.grid[2][0] = Pawn.new(2, 0, 'white', test)
test.grid[1][1].set_valid_captures(test)
test.grid[1][5] = ' '
test.grid[5][5] = King.new(5, 5, 'black', test)
# test.grid[5][5].add_squares_up
# test.grid[1][1].set_squares_threatened
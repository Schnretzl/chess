require_relative 'player'
Dir['/home/whendley/repos/chess/lib/pieces/piece_types/*.rb'].each { |file| require file }

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8, ' ') }
    @white_king_threatened_squares = []
    @black_king_threatened_squares = []
    add_white_pieces
    add_black_pieces
  end

  private

  def add_black_pieces
    add_pawns('black')
    add_rooks('black')
    add_knights('black')
    add_bishops('black')
    add_queen('black')
    add_king('black')
  end

  def add_white_pieces
    add_pawns('white')
    add_rooks('white')
    add_knights('white')
    add_bishops('white')
    add_queen('white')
    add_king('white')
  end

  def add_pawns(color)
    if color == 'black'
      @grid[1].map!.with_index { |square, index| Pawn.new(index, 1, 'black') }
    elsif color == 'white'
      @grid[6].map!.with_index { |square, index| Pawn.new(index, 6, 'white') }
    end
  end

  def add_rooks(color)
    if color == 'black'
      @grid[0][0] = Rook.new(0, 0, 'black')
      @grid[0][7] = Rook.new(0, 7, 'black')
    elsif color == 'white'
      @grid[7][0] = Rook.new(7, 0, 'white')
      @grid[7][7] = Rook.new(7, 7, 'white')
    end
  end

  def add_knights(color)
    if color == 'black'
      @grid[0][1] = Knight.new(0, 1, 'black')
      @grid[0][6] = Knight.new(0, 6, 'black')
    elsif color == 'white'
      @grid[7][1] = Knight.new(7, 1, 'white')
      @grid[7][6] = Knight.new(7, 6, 'white')
    end 
  end

  def add_bishops(color)
    if color == 'black'
      @grid[0][2] = Bishop.new(0, 2, 'black')
      @grid[0][5] = Bishop.new(0, 5, 'black')
    elsif color == 'white'
      @grid[7][2] = Bishop.new(7, 2, 'white')
      @grid[7][5] = Bishop.new(7, 5, 'white')
    end 
  end

  def add_queen(color)
    if color == 'black'
      @grid[0][3] = Queen.new(0, 3, 'black')
    elsif color == 'white'
      @grid[7][3] = Queen.new(7, 3, 'white')
    end 
  end

  def add_king(color)
    if color == 'black'
      @grid[0][4] = King.new(0, 4, 'black')
    elsif color == 'white'
      @grid[7][4] = King.new(7, 4, 'white')
    end 
  end

end

test = Board.new
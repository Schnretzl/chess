require './lib/pieces/piece'

describe Piece do
  subject(:game_piece) { described_class.new(1, 1, 'black') }
  let(:board) { instance_double('Board', grid: Array.new(8) { Array.new(8, ' ') }) }

  before do
    Piece.set_board(board)
  end

end
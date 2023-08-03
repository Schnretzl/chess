require './lib/pieces/piece_types/rook'
require './lib/board'

describe Rook do
  subject(:black_rook) { described_class.new(4, 5, 'black') }
  let(:board) { Board.new }

  before do
    Rook.set_board(board)
    allow(board).to receive(:empty?).and_call_original
  end

  describe '#set_squares_threatened' do
    it 'sets threatened squares for a black rook' do
      board.grid[0][5] = ' '
      board.grid[1][5] = ' '
      black_rook.set_squares_threatened
      expect(black_rook.instance_variable_get(:@squares_threatened)).to \
        contain_exactly([3, 5], [2, 5], [1, 5], [0, 5], \
                        [5, 5], \
                        [4, 4], [4, 3], [4, 2], [4, 1], [4, 0], \
                        [4, 6], [4, 7])
    end
  end
end
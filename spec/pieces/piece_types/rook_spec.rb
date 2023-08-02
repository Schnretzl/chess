require './lib/pieces/piece_types/rook'

describe Rook do
  subject(:black_rook) { described_class.new(5, 5, 'black') }
  let(:board) { instance_double('Board', grid: Array.new(8) { Array.new(8, ' ') }) }

  before do
    Rook.set_board(board)
  end

  describe '#set_squares_threatened' do
    it 'sets threatened squares for a black rook' do
      black_rook.set_squares_threatened
      expect(black_rook.instance_variable_get(:@squares_threatened)).to contain_exactly([4, 5], [3, 5], [2, 5], [1, 5], [0, 5])
    end
  end
end
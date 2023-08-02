require './lib/pieces/piece_types/pawn'

describe Pawn do
  subject(:black_pawn) { described_class.new(1, 1, 'black') }
  let(:board) { instance_double('Board', grid: Array.new(8) { Array.new(8, ' ') }) }

  before do
    Pawn.set_board(board)
  end

  describe '#set_squares_threatened' do
    it 'sets threatened squares for a black pawn' do
      expect(black_pawn.set_squares_threatened).to contain_exactly([2, 0], [2, 2])
    end
  end

  describe '#set_valid_moves' do
    it 'sets valid moves for a black pawn' do
      expect(black_pawn.set_valid_moves).to contain_exactly([1, 2], [1, 3])
    end
  end
end

[
0  [01234567]
1  [01234567]
]
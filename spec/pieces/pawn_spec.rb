require './lib/pieces/piece_types/pawn'

describe Pawn do
  subject(:black_pawn) { described_class.new(1, 1, 'black') }
  subject(:white_pawn) { described_class.new(6, 2, 'white') }
  let(:board) { instance_double('Board', grid: Array.new(8) { Array.new(8, ' ') }) }

  before do
    Pawn.set_board(board)
  end

  describe '#set_squares_threatened' do
    it 'sets threatened squares for a black pawn' do
      expect(black_pawn.set_squares_threatened).to contain_exactly([0, 2], [2, 2])
    end
  end

  describe '#set_valid_moves' do
    it 'sets valid moves for a black pawn' do
      expect(black_pawn.set_valid_moves).to contain_exactly([2, 1], [3, 1])
    end

    it 'sets valid moves for a white pawn which has moved' do
      white_pawn.instance_variable_set(:@has_moved, true)
      white_pawn.set_valid_moves
      expect(white_pawn.instance_variable_get(:@valid_moves)).to contain_exactly([5, 2])
    end

  end

  
end

